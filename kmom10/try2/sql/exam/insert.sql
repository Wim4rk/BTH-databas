--
-- Insert into person
--
LOAD DATA LOCAL INFILE 'person.csv'
INTO TABLE person
CHARSET utf8
FIELDS
TERMINATED BY ','
-- ENCLOSED BY '"'
LINES
TERMINATED BY '\n'
IGNORE 1 LINES
;
--
-- Insert into typ
--
LOAD DATA LOCAL INFILE 'typ.csv'
INTO TABLE typ
CHARSET utf8
FIELDS
TERMINATED BY ','
-- ENCLOSED BY '"'
LINES
TERMINATED BY '\n'
IGNORE 1 LINES
;
--
-- Insert into vapen
--
LOAD DATA LOCAL INFILE 'vapen.csv'
INTO TABLE vapen
CHARSET utf8
FIELDS
    TERMINATED BY ','
    -- ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;
--
-- Kors-tabell person mot vapen
--
LOAD DATA LOCAL INFILE 'person-vapen.csv'
INTO TABLE pv
CHARSET utf8
FIELDS
    TERMINATED BY ','
    -- ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;
