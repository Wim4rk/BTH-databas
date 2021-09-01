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
    SELECT namn, super FROM kategori ORDER BY super, namn;
END
;;

DROP PROCEDURE IF EXISTS get_products;;
CREATE PROCEDURE get_products()
BEGIN
    SELECT
        p.*,
        GROUP_CONCAT(k.namn) AS 'kategori'
    FROM produkt AS p
        JOIN produktkategori AS pk
            ON p.id = pk.produkt
        JOIN kategori AS k
            ON k.id = pk.kategori
    GROUP BY
        p.id;
END
;;

DELIMITER ;
