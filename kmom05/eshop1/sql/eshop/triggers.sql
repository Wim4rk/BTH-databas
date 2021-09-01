--
-- Function for verbose log
--
DROP FUNCTION IF EXISTS verbose;
DELIMITER ;;

CREATE FUNCTION verbose(
    action VARCHAR(12),
    id INT(4)
)
RETURNS TINYTEXT
DETERMINISTIC
BEGIN
    DECLARE log_string TINYTEXT;

    IF action = "uppdatering" THEN
        SET log_string = CONCAT("Produkt med produktid ", id, " uppdaterades");
    ELSEIF action = "tillagg" THEN
        SET log_string = CONCAT("Ny produkt lades till med produktid ", id);
    ELSEIF action = "radering" THEN
        SET log_string = CONCAT("Produkt med produktid ", id, " raderades");
    END IF;

    RETURN log_string;
END
;;

DROP TRIGGER IF EXISTS plog_update;;

CREATE TRIGGER plog_update
AFTER UPDATE
ON produkt FOR EACH ROW
    INSERT INTO produkt_log (handelse)
        VALUES(verbose('uppdatering', NEW.id))
;;

DROP TRIGGER IF EXISTS plog_insert;;
CREATE TRIGGER plog_insert
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO produkt_log (handelse)
        VALUES(verbose('tillagg', NEW.id))
;;

DROP TRIGGER IF EXISTS plog_delete;;

CREATE TRIGGER plog_delete
BEFORE DELETE
ON produkt FOR EACH ROW
    INSERT INTO produkt_log (handelse)
        VALUES(verbose('radering', OLD.id))
;;
