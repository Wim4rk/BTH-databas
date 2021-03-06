USE skolan;

SET NAMES 'utf8';
--
-- Update table larare and larare_pre to use same charset
-- and collation.
--
ALTER TABLE larare CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
ALTER TABLE larare_pre CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;


-- Delete tables in the right order, because dependencies.
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;

CREATE TABLE kurs
(
    kod CHAR(6) NOT NULL PRIMARY KEY,
    namn VARCHAR(15),
    poang FLOAT,
    niva CHAR(3)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_swedish_ci
;

SELECT TABLE_NAME, ENGINE, TABLE_COLLATION
    FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = 'skolan' AND ENGINE IS NOT NULL;

--
-- Create table: kurstillfalle
--

CREATE TABLE kurstillfalle
(
    -- All columns and their definitions
    id INT AUTO_INCREMENT NOT NULL,
    kurskod CHAR(6) NOT NULL,
    kursansvarig CHAR(3) NOT NULL,
    lasperiod INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (kurskod) REFERENCES kurs(kod),
    FOREIGN KEY (kursansvarig) REFERENCES larare(akronym)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_swedish_ci
;

DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
--
-- Ange vilket sätt som tabeller skall lagras på
--
CREATE TABLE t1
(
    i INT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_swedish_ci
;

CREATE TABLE t2
(
    i INT
) ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_swedish_ci
;

SHOW CREATE TABLE kurs\G

--
-- Update table larare and larare_pre to use same charset
-- and collation.
--
ALTER TABLE larare CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
ALTER TABLE larare_pre CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;

SHOW CREATE TABLE kurs\G
