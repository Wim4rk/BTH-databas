--
-- JOIN
--
SELECT
    l.*,
    p.lon AS "pre-lon",
    p.kompetens AS "pre-kompetens"
    p.lon - (SELECT lon FROM larare) AS "diff"
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY akronym
;
