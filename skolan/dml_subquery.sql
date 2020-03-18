USE skolan;


-- Alla lärare på avdelning "DIDD"

SELECT
    akronym
FROM larare
WHERE
    avdelning = 'DIDD'
;

-- Alla kurstillfällen

SELECT *
FROM kurstillfalle
;

--
-- Kurser som ges av lärare vid avdelning "DIDD"
--
SELECT
    *
FROM kurstillfalle
WHERE
    kursansvarig IN (
        SELECT
            akronym
        FROM larare
        WHERE
            avdelning = 'DIDD'
    )
;
