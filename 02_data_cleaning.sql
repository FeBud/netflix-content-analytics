-- Add cleaned date column
ALTER TABLE netflix
ADD COLUMN date_added_clean DATE;


-- Convert text date to DATE format
UPDATE netflix
SET date_added_clean = TO_DATE(date_added, 'Month DD, YYYY')
WHERE date_added IS NOT NULL;


-- Remove leading and trailing spaces
UPDATE netflix
SET
    director = TRIM(director),
    country = TRIM(country),
    rating = TRIM(rating)
WHERE director IS NOT NULL
   OR country IS NOT NULL
   OR rating IS NOT NULL;


-- Verify date conversion
SELECT
    date_added,
    date_added_clean
FROM netflix
LIMIT 10;