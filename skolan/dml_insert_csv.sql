--
-- Delete tables, in order, depending on
-- foreign key constraints.
--
DELETE FROM hund;
DELETE FROM medlem;

--
-- Insert into kurs
--
LOAD DATA LOCAL INFILE '../csv/hund.csv'
INTO TABLE hund
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM hund;

--
-- Insert into kurstillfalle.
--
LOAD DATA LOCAL INFILE '../medlem.csv'
INTO TABLE medlem
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM medlem;
