-- Create View: Country Content

CREATE OR REPLACE VIEW vw_country_content AS
SELECT
    show_id,
    TRIM(UNNEST(STRING_TO_ARRAY(country, ','))) AS country_name
FROM netflix
WHERE country IS NOT NULL;


-- Create View: Genres

CREATE OR REPLACE VIEW vw_genres AS
SELECT
    show_id,
    TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS genre
FROM netflix;


-- Create View: Directors

CREATE OR REPLACE VIEW vw_directors AS
SELECT
    show_id,
    TRIM(UNNEST(STRING_TO_ARRAY(director, ','))) AS director_name
FROM netflix
WHERE director IS NOT NULL;