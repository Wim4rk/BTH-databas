USE skolan;

-- Översikt lärarnas namn
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
    FROM larare;

-- Skapar en VY av samma SELECT
DROP VIEW IF EXISTS v_name_alder;
-- Skapa vyn
CREATE VIEW v_name_alder
AS
SELECT
    akronym AS Akronym,
    CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM larare;

-- Använd vyn
SELECT * FROM v_name_alder;

-- Filtrera ur vyn
SELECT * FROM v_name_alder
    WHERE Namn LIKE '%di%'
    ORDER BY Ålder DESC
    LIMIT 3;

DROP VIEW IF EXISTS v_larare;

-- Skapa en ny vy, allt ur 'larare' + Ålder:
CREATE VIEW v_larare
AS
SELECT *, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
    FROM larare;

-- Beräkna medelåldern mot vyn
SELECT avdelning AS Avdelning,
    ROUND(AVG(Ålder)) AS Snittålder
    FROM v_larare
    GROUP BY Avdelning
;
