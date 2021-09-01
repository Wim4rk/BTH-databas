DELIMITER ;;

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

DELIMITER ;
