-- ============================================
-- 1. Task Description
-- Prepare a table for a report about the national preferences
-- of MovieNow customers by comparing the average movie rating
-- across countries and genres. Include all aggregation levels:
-- country + genre, country-only, genre-only, and the overall total.
--
-- 2. Topics Covered
-- - LEFT JOINs across fact (renting) and dimensions (movies, customers)
-- - AVG() aggregation
-- - GROUP BY CUBE (multi-level aggregation: country, genre)
-- - Reporting-friendly output for comparative analysis
-- - Understanding NULLs in cube totals (rollups)
-- ============================================

-- Average ratings by country and genre, including all cube levels
SELECT
    c.country,
    m.genre,
    AVG(r.rating) AS avg_rating  -- Calculate the average rating
FROM renting AS r
LEFT JOIN movies AS m
  ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
  ON r.customer_id = c.customer_id
GROUP BY CUBE (c.country, m.genre);  -- For all aggregation levels of country and genre

-- Notes:
-- - Rows where country IS NULL and/or genre IS NULL represent subtotal/total levels:
--     * (country, genre) both NOT NULL -> specific country+genre
--     * (country NULL, genre NOT NULL) -> genre across all countries
--     * (country NOT NULL, genre NULL) -> country across all genres
--     * (country NULL, genre NULL)     -> overall average across all countries & genres
-- - If you need to label NULLs for reporting, wrap with COALESCE(country, 'ALL COUNTRIES') etc.
