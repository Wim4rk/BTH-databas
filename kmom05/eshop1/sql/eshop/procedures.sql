--
-- PROCEDURE for verbose log
--
DELIMITER ;;
DROP FUNCTION IF EXISTS verbose;;

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

DROP PROCEDURE IF EXISTS get_categories;;
CREATE PROCEDURE get_categories()
BEGIN
    SELECT namn FROM kategori ORDER BY namn;
END
;;

DELIMITER ;
