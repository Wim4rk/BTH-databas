DROP PROCEDURE IF EXISTS the_dogs;
DELIMITER ;;
CREATE PROCEDURE the_dogs()
BEGIN
    SELECT
        husse,
        fornamn,
        efternamn,
        ort,
        hund,
        url,
        ras,
        godkand
    FROM v_hund
    ORDER BY efternamn, fornamn
    ;
END
;;
DELIMITER ;
