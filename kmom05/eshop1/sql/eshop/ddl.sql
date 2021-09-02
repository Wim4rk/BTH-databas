-- Standarder
USE webshop;
SET NAMES `utf8`;
SET default_storage_engine=InnoDB;
--
-- Töm databasen i omvänd ordning
DROP TABLE IF EXISTS produkt_log;
DROP TABLE IF EXISTS kund_logg;
DROP TABLE IF EXISTS db_logg;
DROP TABLE IF EXISTS bild;
DROP TABLE IF EXISTS recension;
DROP TABLE IF EXISTS plocklista;
DROP TABLE IF EXISTS fakturarad;
DROP TABLE IF EXISTS faktura;
DROP TABLE IF EXISTS orderrad;
DROP TABLE IF EXISTS kundorder;
DROP TABLE IF EXISTS lager;
DROP TABLE IF EXISTS produktkategori;
DROP TABLE IF EXISTS kategori;
DROP TABLE IF EXISTS hylla;
DROP TABLE IF EXISTS produkt;
DROP TABLE IF EXISTS kund;

DROP TABLE IF EXISTS produkt_log;
--
-- Skapa tabeller utan sekundärnycklar
CREATE TABLE kund
(
    kundnummer INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    namn VARCHAR(20) NOT NULL,
    address VARCHAR(20),
    postaddress VARCHAR(20),
    epost VARCHAR(30),
    telefon CHAR(14),
    kod CHAR(32) -- MD5-hash
);

CREATE TABLE produkt
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    benamning VARCHAR(20) NOT NULL,
    beskrivning TEXT,
    pris DOUBLE(6, 2),
    antal INT,
    inkopskostnad DOUBLE(6, 2),
    leverantor VARCHAR(20),
    lev_prod_nr VARCHAR(20)
);

CREATE TABLE hylla
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    lokal VARCHAR(20) NOT NULL,
    hylla VARCHAR(8),
    antal INT
);

CREATE TABLE kategori
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    namn VARCHAR(12),
    super VARCHAR(12)
);
--
-- Skapa tabeller med sekundärnycklar
CREATE TABLE produktkategori
(
    produkt INT NOT NULL,
    kategori INT NOT NULL,
    PRIMARY KEY (produkt, kategori),
    FOREIGN KEY (produkt) REFERENCES produkt(id),
    FOREIGN KEY (kategori) REFERENCES kategori(id)
);


CREATE TABLE lager
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    hylla INT,
    produkt INT,
    FOREIGN KEY (hylla) REFERENCES hylla(id),
    FOREIGN KEY (produkt) REFERENCES produkt(id)
);

--
-- Orderstatus kan vara "inkommen", "plockad",
-- "avsänd" el. dyl.
--
CREATE TABLE kundorder
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    kund INT,
    orderstatus VARCHAR(20),
    FOREIGN KEY (kund) REFERENCES kund(kundnummer)
);

--
-- radstatus kan var "klar", "restad" el. dyl.
--
CREATE TABLE orderrad
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    kundorder INT,
    produkt INT,
    antal INT,
    radstatus VARCHAR(12),
    FOREIGN KEY (kundorder) REFERENCES kundorder(id),
    FOREIGN KEY (produkt) REFERENCES produkt(id)
);

--
-- fakturastatus kan vara "skickad", "försenad"
-- "inkasso" el. dyl.
--
CREATE TABLE faktura
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    kund INT,
    fakturanummer INT,
    fakturastatus VARCHAR(12),
    FOREIGN KEY (kund) REFERENCES kund(kundnummer)
);

CREATE TABLE fakturarad
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    faktura INT,
    orderrad INT,
    antal INT,
    FOREIGN KEY (faktura) REFERENCES faktura(id),
    FOREIGN KEY (orderrad) REFERENCES orderrad(id)
);

CREATE TABLE plocklista
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    orderrad INT,
    hylla INT,
    FOREIGN KEY (orderrad) REFERENCES orderrad(id),
    FOREIGN KEY (hylla) REFERENCES hylla(id)
);

CREATE TABLE recension
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    produkt INT,
    recensent VARCHAR(20),
    betyg TINYINT,
    fritext TEXT,
    FOREIGN KEY (produkt) REFERENCES produkt(id)
);

CREATE TABLE bild
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    produkt INT,
    lank VARCHAR(25),
    bildtext TINYTEXT,
    FOREIGN KEY (produkt) REFERENCES produkt(id)
);
--
-- Loggar
-- CREATE TABLE db_logg
-- (
--     id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     faktura INT,
--     kundorder INT,
--     kund INT,
--     fakturastatus VARCHAR(12),
--     orderstatus VARCHAR(12),
--     tidpunkt TIMESTAMP,
--     FOREIGN KEY (faktura) REFERENCES faktura(id),
--     FOREIGN KEY (kundorder) REFERENCES kundorder(id),
--     FOREIGN KEY (kund) REFERENCES kund(kundnummer)
-- );
--
-- CREATE TABLE kund_logg
-- (
--     id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     kund INT,
--     status VARCHAR(8),
--     tidpunkt TIMESTAMP,
--     FOREIGN KEY (kund) REFERENCES kund(kundnummer)
-- );


-- Above to be used later
CREATE TABLE produkt_log
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tidpunkt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    handelse TINYTEXT
)
