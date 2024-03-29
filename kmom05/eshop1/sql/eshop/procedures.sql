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

DROP PROCEDURE IF EXISTS get_product;;
CREATE PROCEDURE get_product(
    a_id INT
)
BEGIN
    SELECT
        p.*,
        p.benamning AS 'link',
        GROUP_CONCAT(k.namn) AS 'kategori'
    FROM produkt AS p
        JOIN produktkategori AS pk
            ON p.id = pk.produkt
        LEFT OUTER JOIN kategori AS k
            ON k.id = pk.kategori
    WHERE p.id = a_id
    GROUP BY
        p.id;
END
;;

DROP PROCEDURE IF EXISTS get_products;;
CREATE PROCEDURE get_products()
BEGIN
    SELECT
        p.*,
        CONCAT('<a href="product/', p.id, '">', p.benamning, '</a>') AS 'link',
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
DROP PROCEDURE IF EXISTS create_product;;
CREATE PROCEDURE create_product(
    a_benamning VARCHAR(20),
    a_beskrivning TEXT,
    a_pris DOUBLE(6, 2),
    a_antal INT
)
BEGIN
    INSERT INTO produkt (benamning, beskrivning, pris,  antal)
        VALUES (a_benamning, a_beskrivning, a_pris, a_antal);
END
;;

--
-- Create procedure to edit product
--
DROP PROCEDURE IF EXISTS update_product;;

CREATE PROCEDURE update_product(
    a_id INT,
    a_benamning VARCHAR(20),
    a_beskrivning TEXT,
    a_pris DOUBLE(6, 2),
    a_antal INT
)
BEGIN
    UPDATE produkt SET
        benamning = a_benamning,
        beskrivning = a_beskrivning,
        pris = a_pris,
        antal = a_antal
    WHERE
        id = a_id;
END
;;

--
-- Create procedure to delete product
--
DROP PROCEDURE IF EXISTS delete_product;;

CREATE PROCEDURE delete_product(
    a_id INT
)
BEGIN
    DELETE FROM produktkategori
        WHERE
        `produkt` = a_id;
    DELETE FROM produkt
        WHERE
        `id` = a_id;
END
;;

--
-- Create procedure to read from log
--
DROP PROCEDURE IF EXISTS show_log;;

CREATE PROCEDURE show_log(
    v_rows INT
)
BEGIN
    SELECT * FROM produkt_log
        ORDER BY `tidpunkt` DESC
        LIMIT v_rows;
END
;;


--
-- Create procedure that shows shelves
--
DROP PROCEDURE IF EXISTS show_shelves;;

CREATE PROCEDURE show_shelves()
BEGIN
    SELECT DISTINCT lokal, hylla, hyllplan FROM hylla;
END
;;

--
-- Create procedures to search inventory
--
DROP PROCEDURE IF EXISTS inventory;;

CREATE PROCEDURE inventory()
BEGIN
    SELECT * FROM v_lagerstatus;
END
;;

DROP PROCEDURE IF EXISTS inventory_search;;

CREATE PROCEDURE inventory_search(
    s_term VARCHAR(20)
)
BEGIN
    SELECT * FROM v_lagerstatus
        WHERE id LIKE CONCAT("%", s_term, "%")
        OR namn LIKE CONCAT("%", s_term, "%")
        OR hylla LIKE CONCAT("%", s_term, "%")
    ;
END
;;


DROP PROCEDURE IF EXISTS add_inventory;;

CREATE PROCEDURE add_inventory(
    prod INT,
    shelf INT,
    num INT
)
BEGIN
    INSERT INTO lager
        (hylla, produkt, antal)
    VALUES (shelf, prod, num);
END
;;

DROP PROCEDURE IF EXISTS del_inventory;;

CREATE PROCEDURE del_inventory(
    prod INT,
    shelf INT,
    num INT
)
BEGIN
    UPDATE `lager`
        SET `antal` = `antal` - num
    WHERE `antal` > 0 AND `produkt` = prod AND `hylla` = shelf;
END
;;

DELIMITER ;
