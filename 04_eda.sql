-- Movie vs TV Show
SELECT
    type,
    COUNT(*) AS total_content
FROM netflix
GROUP BY type
ORDER BY total_content DESC;


-- Content added by year
SELECT
    EXTRACT(YEAR FROM date_added_clean) AS year_added,
    COUNT(*) AS total_content
FROM netflix
WHERE date_added_clean IS NOT NULL
GROUP BY year_added
ORDER BY year_added;


-- Top 10 countries by content count
SELECT
    country_name,
    COUNT(*) AS total_content
FROM vw_country_content
GROUP BY country_name
ORDER BY total_content DESC
LIMIT 10;


-- Top 10 genres
SELECT
    genre,
    COUNT(*) AS total_content
FROM vw_genres
GROUP BY genre
ORDER BY total_content DESC
LIMIT 10;


-- Top 10 directors
SELECT
    director_name,
    COUNT(*) AS total_titles
FROM vw_directors
GROUP BY director_name
ORDER BY total_titles DESC
LIMIT 10;


-- Rating distribution
SELECT
    rating,
    COUNT(*) AS total_content
FROM netflix
GROUP BY rating
ORDER BY total_content DESC;


-- Movie Release Trend
SELECT
    release_year,
    COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
GROUP BY release_year
ORDER BY release_year;


-- TV Show release trend
SELECT
    release_year,
    COUNT(*) AS total_tv_shows
FROM netflix
WHERE type = 'TV Show'
GROUP BY release_year
ORDER BY release_year;


