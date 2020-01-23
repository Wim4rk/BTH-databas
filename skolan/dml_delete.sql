--
-- Delete from database skolan.
-- Olov Wimark
-- 2020-01-23
--

DELETE FROM larare WHERE fornamn = 'Hagrid';

DELETE FROM larare WHERE avdelning = 'DIPT';

-- Delete teachers that has a salary
-- but no more than two of them
DELETE FROM larare WHERE lon IS NOT NULL
    LIMIT 2;

-- Delete everythin
DELETE FROM larare;
