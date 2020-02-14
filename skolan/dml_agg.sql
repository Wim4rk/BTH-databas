USE skolan

SELECT avdelning, COUNT(akronym) FROM larare GROUP BY avdelning;

SELECT avdelning, SUM(ny_lon) FROM larare GROUP BY avdelning;

SELECT avdelning, AVG(ny_lon) FROM larare GROUP BY avdelning;

SELECT kon, AVG(ny_lon) FROM larare GROUP BY kon;

SELECT avdelning, AVG(kompetens) AS Kompetens
    FROM larare
    GROUP BY avdelning
    ORDER by Kompetens DESC
    LIMIT 1
    ;

SELECT avdelning AS Avdelning,
    kompetens AS Kompetens,
    ROUND(ny_lon) AS Snittlon,
    COUNT(akronym) AS antal
    FROM larare
    GROUP BY Avdelning, Kompetens
    ORDER BY Avdelning
    ;

SELECT
    avdelning,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(ny_lon) AS Antal
FROM larare
GROUP BY
    avdelning
ORDER BY
    avdelning
;

SELECT
    avdelning,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(ny_lon) AS Antal
FROM larare
GROUP BY
    avdelning
HAVING
    Snittlon > 35000
ORDER BY
    Snittlon DESC
;

SELECT
    avdelning,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(ny_lon) AS Antal
FROM larare
GROUP BY
    avdelning
HAVING
    Antal > 2
ORDER BY
    Snittlon DESC
;

SELECT
    avdelning,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(ny_lon) AS Antal
FROM larare
WHERE
    kompetens = 1
GROUP BY
    avdelning
ORDER BY
    avdelning
;

SELECT
    avdelning,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(ny_lon) AS Antal
FROM larare
WHERE
    kompetens = 1
GROUP BY
    avdelning
HAVING
    Snittlon < 30000
ORDER BY
    avdelning
;

SELECT
    avdelning AS Avdelning,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(akronym) AS Antal
FROM larare
GROUP BY Avdelning
    ORDER BY Avdelning, Snittlon
;

SELECT
    avdelning AS Avdelning,
    kompetens AS Kompetens,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(akronym) AS Antal
FROM larare
GROUP BY Avdelning, Kompetens
    ORDER BY Avdelning, Kompetens DESC
;

SELECT
    avdelning AS Avdelning,
    kompetens AS Kompetens,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(akronym) AS Antal
FROM larare
WHERE Kompetens < 4
GROUP BY Avdelning, Kompetens
    ORDER BY Avdelning, Kompetens DESC
;

SELECT
    avdelning AS Avdelning,
    kompetens AS Kompetens,
    ROUND(AVG(ny_lon)) AS Snittlon,
    COUNT(akronym) AS Antal
FROM larare
WHERE Kompetens < 4
GROUP BY Avdelning, Kompetens
HAVING Antal < 2
    AND Snittlon <= 45000
    AND Snittlon >= 30000
ORDER BY Avdelning, Kompetens DESC
;
