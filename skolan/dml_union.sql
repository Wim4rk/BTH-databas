USE skolan;

-- Replace my column ny_lon. IF needed
DROP PROCEDURE IF EXISTS column_lon;
DELIMITER $$
CREATE PROCEDURE column_lon()
BEGIN
    IF EXISTS(
        SELECT NULL
        FROM information_schema.COLUMNS
        WHERE TABLE_NAME = 'larare'
        AND TABLE_SCHEMA = 'skolan'
        AND COLUMN_NAME = 'ny_lon'
    )
    THEN
        ALTER TABLE larare DROP COLUMN lon;
        ALTER TABLE larare CHANGE ny_lon lon int(11) DEFAULT NULL;
        ALTER TABLE larare MODIFY COLUMN lon int(11) AFTER kon;
    END IF;
END
$$
DELIMITER ;

-- Run procedure
CALL column_lon();

DROP PROCEDURE column_lon;

--
-- UNION
--
SELECT
    *,
    'after' AS origin FROM larare
UNION
SELECT
    *,
    'before' AS origin FROM larare_pre
ORDER BY akronym
;

SELECT
    lon.origin,
    akronym,
    fornamn,
    efternamn,
    kon,
    kompetens,
    lon
FROM
(
    SELECT
        *,
        'after' AS origin FROM larare
    UNION
    SELECT
        *,
        'before' AS origin FROM larare_pre
    ORDER BY akronym
) AS lon
WHERE
    akronym IN ('ala', 'dum')
ORDER BY akronym, origin
;
