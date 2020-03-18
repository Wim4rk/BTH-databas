USE skolan;

--
-- Vilka lärare undervisar?
--
SELECT DISTINCT
        akronym AS Akronym,
        CONCAT(fornamn, " ", efternamn) AS Namn
    FROM v_planering
    ORDER BY akronym
;

--
-- Left outer join, inkludera lärare utan undervisning
--
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    LEFT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
    -- WHERE Kurskod IS NULL -- För att visa bara de som inte undervisar
;

--
-- RIGHT outer join
--
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    RIGHT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
;

--
-- Visa kurser utan planerade kurstillfallen
-- 
SELECT DISTINCT
    k.kod AS Kurskod,
    k.namn AS Kursnamn,
    kt.lasperiod AS Läsperiod
FROM kurs AS k
    LEFT OUTER JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
WHERE kt.lasperiod IS NULL
;
