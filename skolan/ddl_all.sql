--
-- Create tables for db'skolan'
-- Olov Wimark
-- 2020-01-23
--
USE skolan;
SET NAMES 'utf8';

-- Delete tables in the right order, because dependencies.
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;
DROP TABLE IF EXISTS larare;

DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;

CREATE TABLE larare
(
    akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,

    PRIMARY KEY (akronym)
);

--
-- Update table larare and larare_pre to use same charset
-- and collation.
--
ALTER TABLE larare CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;



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

-- SHOW CREATE TABLE kurs;

ALTER TABLE larare
    DROP COLUMN IF EXISTS kompetens;

-- Add column to table
ALTER TABLE larare ADD COLUMN kompetens INT DEFAULT 1;


DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
-- INSERT INTO larare_pre SELECT * FROM larare;
-- Table should be empty at this stage

DROP VIEW IF EXISTS v_name_alder;
-- Skapa vyn
CREATE VIEW v_name_alder
AS
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM larare;


DROP VIEW IF EXISTS v_larare;

-- Skapa en ny vy, allt ur 'larare' + Ålder:
CREATE VIEW v_larare
AS
SELECT *, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
    FROM larare;

DROP VIEW IF EXISTS v_lonerevision;
-- Skapa vyn
CREATE VIEW v_lonerevision
AS
SELECT
    l.akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS namn,
    p.lon AS pre,
    l.lon AS nu,
    l.lon - p.lon AS diff,
    ROUND(((l.lon - p.lon) / p.lon) * 100, 2) AS proc,
    IF(ROUND(((l.lon - p.lon) / p.lon) * 100, 2) > 3, "ok", "nok") as mini,
    p.kompetens AS prekomp,
    l.kompetens AS nukomp,
    l.kompetens - p.kompetens AS diffkomp
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY l.akronym
;
