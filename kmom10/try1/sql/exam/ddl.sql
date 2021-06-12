USE exam;

SET NAMES 'utf8';

-- Delete tables in the right order, because dependencies.
DROP TABLE IF EXISTS medlem2hund;
DROP TABLE IF EXISTS hund;
DROP TABLE IF EXISTS ras;
DROP TABLE IF EXISTS medlem;


CREATE TABLE ras
(
    id CHAR(2) NOT NULL,
    namn VARCHAR(30),
    godkand VARCHAR(3),

    PRIMARY KEY (id)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;



CREATE TABLE hund
(
    id INT(4) NOT NULL,
    namn VARCHAR(20),
    url TEXT,
    ras_id CHAR(2),

    PRIMARY KEY (id),
    FOREIGN KEY (ras_id) REFERENCES ras(id)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;



CREATE TABLE medlem
(
    id INT(4) NOT NULL,
    fornamn VARCHAR(20),
    alias VARCHAR(30),
    efternamn VARCHAR(20),
    ort VARCHAR(20),

    PRIMARY KEY (id)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;



CREATE TABLE medlem2hund
(
    id INT(4) NOT NULL,
    medlem_id INT(4),
    hund_id INT(4),
    registrerad YEAR,

    PRIMARY KEY (id),
    FOREIGN KEY (medlem_id) REFERENCES medlem(id),
    FOREIGN KEY (hund_id) REFERENCES hund(id)
) ENGINE=InnoDB,
DEFAULT CHARSET=utf8,
COLLATE utf8_swedish_ci;
