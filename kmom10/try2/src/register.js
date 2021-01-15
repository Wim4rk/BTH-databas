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
