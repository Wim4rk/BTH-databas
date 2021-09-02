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
        LEFT OUTER JOIN kategori AS k
            ON k.id = pk.kategori
    GROUP BY
        p.id;
END
;;

--
-- Create procedure for insert into account
--
DROP PROCEDURE IF EXISTS create_product;
CREATE PROCEDURE create_product(
    a_benamning CHAR(20),
    a_beskrivning TEXT,
    a_pris DOUBLE(6, 2),
    a_antal INT
)
BEGIN
    INSERT INTO produkt (benamning, beskrivning, pris,  antal)
        VALUES (a_benamning, a_beskrivning, a_pris, a_antal);
END
;;

DELIMITER ;
