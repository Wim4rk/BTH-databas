USE skolan;


-- Display first- and last names, with department concatenated
SELECT
    CONCAT(fornamn, " ", efternamn, " (", avdelning, ")")
    AS NamnAvdelning FROM larare;

-- And just the top three, with department in lower case letters

SELECT
    CONCAT(fornamn, " ", efternamn, " (", LOWER(avdelning), ")")
        AS NamnAvdelning
    FROM larare
    LIMIT 3
    ;

-- Return current date
SELECT DATE(NOW());

-- Return names, current date and current time
SELECT
    fornamn,
    fodd,
    DATE(NOW()) AS "Dagens datum",
    TIME(NOW()) AS Klockslag
    FROM larare
;

-- Return teachers age
SELECT
    fornamn,
    fodd,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) as Alder
    FROM larare
;

--Return techers month of birth
SELECT
    fornamn,
    fodd,
    MONTHNAME(fodd) AS 'Månad'
    FROM larare
;

-- Filter on month of birth
SELECT
    fornamn,
    fodd,
    MONTHNAME(fodd) AS 'Månad'
    FROM larare
    WHERE MONTH(fodd) = 5
;

-- Okay way to echo comments?
SELECT "-- Show teachers born in the forties." AS Comment;

SELECT
    fornamn,
    YEAR(fodd)
    FROM larare
    WHERE YEAR(fodd) BETWEEN 1940 AND 1950
;
