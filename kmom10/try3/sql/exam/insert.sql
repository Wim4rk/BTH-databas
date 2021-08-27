--
-- Delete tables, in order, depending on
-- foreign key constraints.
--
DELETE FROM kategori;
DELETE FROM hylla;
DELETE FROM bok;
DELETE FROM anledning;


LOAD DATA LOCAL INFILE 'bok.csv'
INTO TABLE bok
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM bok;

--
-- Insert into hylla.
--
LOAD DATA LOCAL INFILE 'hylla.csv'
INTO TABLE hylla
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM hylla;



LOAD DATA LOCAL INFILE 'anledning.csv'
INTO TABLE anledning
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM anledning;


LOAD DATA LOCAL INFILE 'kategori.csv'
INTO TABLE kategori
CHARSET utf8
FIELDS
TERMINATED BY ','
ENCLOSED BY '"'
LINES
TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM kategori;
