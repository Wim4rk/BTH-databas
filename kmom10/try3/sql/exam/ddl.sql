USE exam;

SET NAMES 'utf8';

-- Delete tables in the right order, because dependencies.
DROP TABLE IF EXISTS kategori;
DROP TABLE IF EXISTS hylla;
DROP TABLE IF EXISTS bok;
DROP TABLE IF EXISTS anledning;


CREATE TABLE anledning
(
    typ VARCHAR(20) NOT NULL,
    anledning VARCHAR(50),

    PRIMARY KEY (typ)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;


CREATE TABLE bok
(
    id INT(4) NOT NULL,
    titel VARCHAR(50),
    forfattare VARCHAR(50),

    PRIMARY KEY (id)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;

CREATE TABLE hylla
(
    id CHAR(2) NOT NULL,
    bok_id INT(4),
    utlanad VARCHAR(20),

    PRIMARY KEY (id),
    FOREIGN KEY (bok_id) REFERENCES bok(id)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;


CREATE TABLE kategori
(
    bok_id INT(4) NOT NULL,
    kategori_typ VARCHAR(50),

    PRIMARY KEY (bok_id, kategori_typ),
    FOREIGN KEY (bok_id) REFERENCES bok(id)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;
