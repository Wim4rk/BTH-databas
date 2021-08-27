DROP VIEW IF EXISTS v_bok;

CREATE VIEW v_bok
AS
SELECT
    b.id AS bok,
    b.forfattare AS forfattare,
    b.titel AS titel,
    k.kategori_typ AS kategori,
    h.id as hylla,
    h.utlanad,
    a.anledning AS forbjuden
FROM bok AS b
    JOIN hylla AS h
        ON b.id = h.bok_id
    LEFT OUTER JOIN kategori AS k
        ON b.id = k.bok_id
    LEFT OUTER JOIN anledning AS a
        ON a.typ = k.kategori_typ
;

SELECT * FROM v_bok;
