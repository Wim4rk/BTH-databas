IF (EXISTS (SELECT * FROM information_schema.COLUMNS
            WHERE TABLE_NAME = larare
            AND COLUMN_NAME = ny_lon),
BEGIN
    -- ALTER TABLE larare DROP COLUMN lon;
    -- ALTER TABLE larare CHANGE ny_lon lon int(11) DEFAULT NULL;
    -- ALTER TABLE larare MODIFY COLUMN lon int(11) AFTER kon;
    SELECT "Inside an IF statement" AS Feedback;
END);

-- EOF
