--
-- Log table
--
DROP TABLE IF EXISTS account_log;
CREATE TABLE account_log
(
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `what` VARCHAR(20),
    `account` CHAR(4),
    `balance` DECIMAL(4, 2),
    `amount` DECIMAL(4, 2)
);

-- DELETE FROM account_log;
SELECT * FROM account_log;

--
-- Procedure move_money()
--
DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
    from_account CHAR(4),
    to_account CHAR(4),
    amount NUMERIC(4, 2)
)
MAIN:BEGIN
    DECLARE current_balance NUMERIC(4, 2);

    START TRANSACTION;

    SELECT balance INTO current_balance FROM account WHERE id = from_account;
    SELECT current_balance;

    IF current_balance - amount < 0 THEN
        ROLLBACK;
        SELECT `Amount on the account is not enough to make transaction.` AS message;
        LEAVE MAIN;
    END IF;

    UPDATE account
        SET
            balance = balance + amount
        WHERE
            id = to_account;

    UPDATE account
        SET
            balance = balance - amount
        WHERE
            id = from_account;

    INSERT INTO
       account_log (what, account, amount)
       VALUES
           ('move_money from', from_account, -amount),
           ('move_money to', to_account, amount);
    COMMIT;
    SELECT * FROM account;
    SELECT * FROM account_log;
END
;;

DELIMITER ;

--
-- Trigger for logging
--
DROP TRIGGER IF EXISTS log_balance_update;

CREATE TRIGGER log_balance_update
AFTER UPDATE
ON account FOR EACH ROW
    INSERT INTO account_log (`what`, `account`, `balance`, `amount`)
        VALUES ('trigger', NEW.id, NEW.balance, NEW.balance - OLD.balance);


--
-- Trigger with compound statement
--
DROP TRIGGER IF EXISTS trigger_test1;

DELIMITER ;;
CREATE TRIGGER trigger_test1
AFTER UPDATE
ON account FOR EACH ROW
BEGIN

-- STATEMENTS

END
;;
DELIMITER;


--
-- Trigger with compound statements and user defined errors
--
DROP TRIGGER IF EXISTS trigger_test2;

DELIMITER ;;

CREATE TRIGGER trigger_test2
BEFORE UPDATE
ON account FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET message_text = 'Custom error message!';
END
;;

DELIMITER ;

-- Delete test triggers

DROP TRIGGER IF EXISTS trigger_test1;
DROP TRIGGER IF EXISTS trigger_test2;

CALL move_money('1111', '2222', 1.5);
SELECT * FROM account;
