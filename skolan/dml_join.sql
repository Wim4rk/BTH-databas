USE skolan;
--
-- JOIN
--

SELECT
    l.akronym,
    l.lon,
    l.kompetens,
    p.lon AS "salary",
    p.kompetens AS "kompetens"
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY akronym
;

SELECT
    CONCAT(l.fornamn, " ", l.efternamn) AS name,
    p.lon AS salary,
    l.lon AS "new sal.",
    l.lon - p.lon AS diff,
    ROUND(((l.lon - p.lon) / p.lon) * 100, 2) AS proc
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY l.akronym
;

SELECT
    l.akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS name,
    p.lon AS salary,
    l.lon AS "new sal.",
    l.lon - p.lon AS diff,
    ROUND(((l.lon - p.lon) / p.lon) * 100, 2) AS proc,
    IF(ROUND(((l.lon - p.lon) / p.lon) * 100, 2) > 3, "ok", "nok") as mini
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY l.akronym
;

-- Skapar en VY av samma SELECT
DROP VIEW IF EXISTS v_lonerevision;
-- Skapa vyn
CREATE VIEW v_lonerevision
AS
SELECT
    l.akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS namn,
    p.lon AS pre,
    l.lon AS nu,
    l.lon - p.lon AS diff,
    ROUND(((l.lon - p.lon) / p.lon) * 100, 2) AS proc,
    IF(ROUND(((l.lon - p.lon) / p.lon) * 100, 2) > 3, "ok", "nok") as mini,
    p.kompetens AS prekomp,
    l.kompetens AS nukomp,
    l.kompetens - p.kompetens AS diffkomp
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym
ORDER BY l.akronym
;

SELECT
    akronym,
    namn,
    pre,
    nu,
    diff,
    proc,
    mini
FROM v_lonerevision
ORDER BY proc DESC
;

SELECT
    akronym,
    namn,
    prekomp,
    nukomp,
    diffkomp
FROM v_lonerevision
ORDER BY nukomp DESC, diffkomp DESC
;
