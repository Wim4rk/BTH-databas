--
-- Delete tables, in order, depending on
-- foreign key constraints.
--
DELETE FROM medlem2hund;
DELETE FROM hund;
DELETE FROM ras;
DELETE FROM medlem;



LOAD DATA LOCAL INFILE 'ras.csv'
INTO TABLE ras
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM ras;
--
-- Insert into hund
--
LOAD DATA LOCAL INFILE 'hund.csv'
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
-- Insert into medlem.
--
LOAD DATA LOCAL INFILE 'medlem.csv'
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



LOAD DATA LOCAL INFILE 'medlem2hund.csv'
INTO TABLE medlem2hund
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM medlem2hund;
