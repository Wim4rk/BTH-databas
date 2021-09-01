--
-- Delete tables, in order, depending on
-- foreign key constraints.
--
DELETE FROM lager;
DELETE FROM produktkategori;
DELETE FROM kategori;
DELETE FROM hylla;
DELETE FROM produkt;
DELETE FROM kund;
DELETE FROM produkt_log;

--
-- Insert into lager.
--
LOAD DATA LOCAL INFILE 'lager.csv'
INTO TABLE lager
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 2 LINES
;

SELECT * FROM lager;

--
-- Insert into produktkategori.
--
LOAD DATA LOCAL INFILE 'produktkategori.csv'
INTO TABLE produktkategori
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 2 LINES
;

SELECT * FROM produktkategori;

--
-- Insert into kategori.
--
LOAD DATA LOCAL INFILE 'kategori.csv'
INTO TABLE kategori
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 2 LINES
;

SELECT * FROM kategori;

--
-- Insert hylla
--
LOAD DATA LOCAL INFILE 'hylla.csv'
INTO TABLE hylla
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 2 LINES
;

SELECT * FROM hylla;

--
-- Insert into produkt.
--
LOAD DATA LOCAL INFILE 'produkt.csv'
INTO TABLE produkt
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 2 LINES
(id, benamning, beskrivning, pris, inkopskostnad, leverantor, lev_prod_nr)
;

SELECT * FROM produkt;


--
-- Insert into kund.
--
LOAD DATA LOCAL INFILE 'kund.csv'
INTO TABLE kund
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 2 LINES
(kundnummer, namn, address, postaddress, epost, telefon, kod)
;

SELECT * FROM kund;
