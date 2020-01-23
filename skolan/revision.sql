-- Lönerevision Hogwarts
--

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

-- Minervas lön har ökat med 4000
UPDATE larare SET ny_lon = lon + 4000 WHERE akronym = 'min';

-- Argus får 2000 i risktillägg. Hans kompetens blir 3.
UPDATE larare SET ny_lon = lon + 2000, kompetens = 3 WHERE akronym = 'fil';

-- Gyllenroy och Alastor får avdrag 3000
UPDATE larare SET ny_lon = lon - 3000 WHERE akronym = 'gyl' OR akronym = 'ala';

-- Alla på DIDD får 2%
UPDATE larare SET ny_lon = ny_lon + ny_lon * 0.02 WHERE avdelning = 'DIDD';
