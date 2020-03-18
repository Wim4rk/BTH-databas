USE skolan;

--
-- En tabell som underlag för planering. Använder JOIN
-- Har alldeles för många kolumner.
--
DROP VIEW IF EXISTS v_planering;

CREATE VIEW v_planering
AS
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig
;

--
-- Hur mycket jobbar varje lärare?
-- Vem har flest undervisningstillfällen?
--
SELECT
    akronym AS Akronym,
    CONCAT(fornamn, " ", efternamn) AS Namn,
    COUNT(kod) AS Tillfällen
FROM v_planering
GROUP BY Akronym
ORDER BY Tillfällen DESC,
    Namn ASC
;

--
-- Ange kurser för de tre äldsta lärarna som undervisar
--
SELECT
    vpl.kod AS Kod,
    vpl.namn AS Kursnamn,
    vpl.kursansvarig AS Ansvarig,
    vaa.Namn,
    vaa.Ålder
    FROM v_planering AS vpl
    JOIN v_name_alder AS vaa
        ON vpl.kursansvarig = vaa.Akronym
    JOIN (
            SELECT kursansvarig AS ansv
            FROM v_planering
            GROUP BY kursansvarig
            ORDER BY fodd
            ASC LIMIT 3
        ) AS triple
        ON triple.ansv = vaa.Akronym
    ORDER BY vaa.Ålder DESC,
        Kod ASC
;
