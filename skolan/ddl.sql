USE skolan;
--
-- Create tables for DB 'skolan'
-- Olov Wimark
-- 2020-01-23
--

-- Delete tables in the right order, because dependencies.
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;
DROP TABLE IF EXISTS larare;
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
