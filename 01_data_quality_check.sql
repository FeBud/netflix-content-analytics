-- DATA QUALITY CHECK

-- Total records
SELECT COUNT(*) AS total_rows
FROM netflix;


-- Missing values
SELECT
    -- Director
    COUNT(*) FILTER (WHERE director IS NULL) AS missing_director,
    ROUND(COUNT(*) FILTER (WHERE director IS NULL) * 100.0 / COUNT(*), 1) AS pct_director,

    -- Country
    COUNT(*) FILTER (WHERE country IS NULL) AS missing_country,
    ROUND(COUNT(*) FILTER (WHERE country IS NULL) * 100.0 / COUNT(*), 1) AS pct_country,

    -- Rating
    COUNT(*) FILTER (WHERE rating IS NULL) AS missing_rating,
    ROUND(COUNT(*) FILTER (WHERE rating IS NULL) * 100.0 / COUNT(*), 1) AS pct_rating,

    -- Date Added
    COUNT(*) FILTER (WHERE date_added IS NULL) AS missing_date_added,
    ROUND(COUNT(*) FILTER (WHERE date_added IS NULL) * 100.0 / COUNT(*), 1) AS pct_date_added

FROM netflix;


-- Duplicate show_id
SELECT
    show_id,
    COUNT(*) AS duplicate_count
FROM netflix
GROUP BY show_id
HAVING COUNT(*) > 1;


-- Content types
SELECT DISTINCT type
FROM netflix;


-- Content distribution
SELECT
    type,
    COUNT(*) AS total_content
FROM netflix
GROUP BY type;


-- Rating distribution
SELECT
    rating,
    COUNT(*) AS total_content
FROM netflix
GROUP BY rating
ORDER BY total_content DESC;


-- Release year range
SELECT
    MIN(release_year) AS earliest_release_year,
    MAX(release_year) AS latest_release_year
FROM netflix;