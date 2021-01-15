--
-- Delete tables in the right order
--

DROP TABLE IF EXISTS pv;
DROP TABLE IF EXISTS vapen;
DROP TABLE IF EXISTS typ;
DROP TABLE IF EXISTS person;

CREATE TABLE person (
    id int(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fornamn varchar(20),
    alias varchar(20),
    efternamn varchar(20),
    ort varchar(20),
    landskod varchar(5)
);

CREATE TABLE typ (
    id varchar(2) NOT NULL PRIMARY KEY,
    namn varchar(20),
    godkant varchar(10)
);

CREATE TABLE vapen (
    id int(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    namn varchar(40),
    typ_id varchar(2) NOT NULL,
    FOREIGN KEY (typ_id) REFERENCES typ(id)
);

CREATE TABLE pv (
    id int(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    person_id int(1),
    vapen_id int(1),
    giltigt int(4),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (vapen_id) REFERENCES vapen(id)
);

DROP VIEW IF EXISTS v_register;

CREATE VIEW v_register
AS
SELECT
    fornamn,
    efternamn,
    alias,
    ort,
    v.namn,
    v.typ_id,
    pv.giltigt
FROM person AS p
    JOIN pv AS pv
        ON p.id = pv.person_id
    JOIN vapen AS v
        ON v.id = pv.vapen_id
;
