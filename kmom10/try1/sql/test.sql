DROP VIEW IF EXISTS v_hund;

CREATE VIEW v_hund
AS
SELECT
    h.namn,
    h.url,
    h.ras_id,
    r.namn AS ras,
    r.godkand,
    mh.medlem_id,
    CONCAT(m.fornamn, " ", m.alias, " ", m.efternamn) AS husse,
    m.ort
FROM hund as h
    JOIN ras AS r
        ON h.ras_id = r.id
    JOIN medlem2hund AS mh
        ON h.id = mh.hund_id
    JOIN medlem AS m
        ON mh.medlem_id = m.id
;

SELECT * FROM v_hund

-- CREATE VIEW v_hund
-- AS
-- SELECT *
-- FROM hund;
--
-- SELECT * FROM v_hund


-- SELECT
--     CONCAT(m.fornamn, " ", m.alias, " ", m.efternamn) AS namn,
--     m.ort AS ort,
--     CONCAT('<a href="', h.url, '">', h.namn, '</a>')AS hund,
--     r.namn AS ras,
--     r.godkand AS gokand
-- FROM medlem AS m
--     JOIN hund AS h
--         on m.
