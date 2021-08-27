DROP PROCEDURE IF EXISTS all_books;
DELIMITER ;;
CREATE PROCEDURE all_books()
BEGIN
    SELECT
        bok,
        forfattare,
        titel,
        kategori,
        hylla,
        IFNULL(utlanad, "---") AS utlanad,
        forbjuden
    FROM v_bok
    ORDER BY bok
    ;
END
;;
DELIMITER ;
