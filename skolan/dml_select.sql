SELECT akronym, avdelning FROM larare;

SELECT akronym AS '1' FROM larare WHERE avdelning = 'DIDD';

SELECT akronym AS '2' FROM larare WHERE akronym LIKE 'h%';

SELECT akronym AS '3' FROM larare WHERE fornamn LIKE '%o%';

SELECT akronym AS '4' FROM larare WHERE ny_lon > 30000 AND ny_lon < 50000;

SELECT akronym AS '5' FROM larare WHERE ny_lon > 40000 AND kompetens < 7;

SELECT akronym AS '6', fornamn, efternamn FROM larare WHERE akronym IN  ('sna', 'dum', 'min');

SELECT akronym AS '7', avdelning, kompetens, ny_lon FROM larare
    WHERE ny_lon > 80000 OR kompetens = 2 AND avdelning = 'ADM';


SELECT CONCAT(fornamn, ' ', efternamn) AS 'Namn', ny_lon AS 'Lön'
    FROM larare;


SELECT CONCAT(fornamn, ' ', efternamn) AS 'Namn', ny_lon AS 'Lön'
    FROM larare
    ORDER BY efternamn ASC;

-- Lägg till LIMIT... Till exempel
