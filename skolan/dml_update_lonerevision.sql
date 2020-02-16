USE skolan;

-- Lönerevision Hogwarts
--

-- VI SKA KOPIERA TABELLEN OCKSÅ
-- =============================
--
-- Make copy of table
--
DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;

-- Lönekolumnen på fel ställe, ändra ordning på kolumnerr
ALTER TABLE larare
    MODIFY COLUMN lon int(11)
    AFTER kon;

-- Beräkna lönepotten
-- Summa löner. 6,4%.
SELECT ROUND(SUM(lon)*0.064, 0) as Pott FROM larare;
-- Det behövs en kolumn för att lagra den nya lönen
ALTER TABLE larare ADD COLUMN ny_lon INT;
-- Lägger gamla lönen där (kommer behövas för vissa uträkningar)
UPDATE larare SET ny_lon = lon;


-- Albus kompetens är nu 7
UPDATE larare SET kompetens = 7 WHERE akronym = 'dum';
-- Albus nya lön är 85 000
UPDATE larare SET ny_lon = 85000 WHERE akronym = 'dum';


-- Minervas lön har ökat med 4 000
UPDATE larare SET ny_lon = lon + 4000 WHERE akronym = 'min';

-- Argus får 2 000 i risktillägg. Hans kompetens blir 3.
UPDATE larare SET ny_lon = lon + 2000, kompetens = 3
    WHERE akronym = 'fil';

-- Gyllenroy och Alastor får avdrag 3 000
UPDATE larare SET ny_lon = lon - 3000
    WHERE akronym = 'gyl' OR akronym = 'ala';

-- Alla på DIDD får 2% extra
UPDATE larare SET ny_lon = ny_lon + ny_lon * 0.02
    WHERE avdelning = 'DIDD';

-- Kvinnor under 40 000 får 3% extra
UPDATE larare SET ny_lon = ny_lon + ny_lon * 0.03
    WHERE kon = 'K' and ny_lon < 40000;

-- Snape, Minerva, Hagrid +5000 och kompetens +1
UPDATE larare SET ny_lon = ny_lon + 5000, kompetens = kompetens +1
    WHERE akronym = 'sna' OR akronym = 'min' OR akronym = 'hag';

-- Alla skall ha 2,2% utom SNA, MIN, HAG och DUM
UPDATE larare SET ny_lon = ny_lon + ny_lon * 0.022
    WHERE NOT akronym = 'sna'
        AND NOT akronym = 'min'
        AND NOT akronym = 'hag'
        AND NOT akronym = 'dum';

-- Vad är den nya lönesumman
SELECT  SUM(ny_lon) AS Lönesumma,
        ((SUM(ny_lon)-SUM(lon))/SUM(lon))*100 AS "Ökning %",
        SUM(kompetens) AS Kompetens
    FROM larare
;

-- Kontroll
SELECT akronym, avdelning, fornamn, kon, ny_lon, kompetens
    FROM larare
    ORDER BY ny_lon DESC;
