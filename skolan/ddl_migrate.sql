ALTER TABLE larare
    DROP COLUMN IF EXISTS kompetens;

-- Add column to table
ALTER TABLE larare ADD COLUMN kompetens INT
    DEFAULT 1;
