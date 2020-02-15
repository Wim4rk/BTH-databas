USE skolan;

-- Svenska och internationella tecken

SET NAMES 'utf8';

DROP TABLE IF EXISTS person;

CREATE TABLE person
(
    fornamn VARCHAR(10)
);

INSERT INTO person VALUES
("Örjan"), ("Börje"), ("Bo"), ("Øjvind"),
("Åke"), ("Åkesson"), ("Arne"), ("Ängla"),
("Ægir")
;

-- Hantera teckenuppsättningar:
SHOW CHARSET LIKE 'latin1';

SHOW COLLATION WHERE Charset = 'latin1';

SELECT HEX("©");

ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_unicode_ci;
SELECT 'Changed to utf8_unicode_ci' AS Output;

SELECT * FROM person ORDER BY fornamn;

-- SHOW COLLATION WHERE Charset = 'utf8';
-- SELECT 'Commented out SHOW COLLATION' AS Output;

ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
-- SELECT 'Changed to utf8_unicode_ci' AS Output;

SELECT * FROM person ORDER BY fornamn;
