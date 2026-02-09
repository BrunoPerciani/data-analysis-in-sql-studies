-- ============================================
-- 1. Task Description
-- Study preferences of genres across countries to identify
-- whether certain genres are more popular in specific countries.
-- Evaluate customer preferences by computing the average rating
-- and the number of rentals for each (country, genre) combination,
-- and include subtotal and grand total levels for reporting.
--
-- 2. Topics Covered
-- - LEFT JOINs to combine fact (renting) with dimensions (movies, customers)
-- - AVG() to measure preference intensity (average rating)
-- - COUNT(*) to measure engagement/volume (number of rentals)
-- - GROUP BY ROLLUP(country, genre) to include subtotals and grand total
-- - ORDER BY for readable output
-- ============================================

-- Group by each country and genre with OLAP ROLLUP to include subtotals and grand total
SELECT
    c.country,
    m.genre,
    AVG(r.rating) AS avg_rating,  -- average customer rating per group
    COUNT(*)     AS num_rating    -- number of rentals contributing to the average
FROM renting AS r
LEFT JOIN movies    AS m ON m.movie_id     = r.movie_id
LEFT JOIN customers AS c ON r.customer_id  = c.customer_id
GROUP BY ROLLUP (c.country, m.genre)
ORDER BY c.country, m.genre;

-- Notes:
-- - Rows where m.genre IS NULL (with country present) are country-level subtotals.
-- - Rows where c.country IS NULL (with genre present) are genre-level subtotals across all countries.
-- - Rows where both are NULL represent the overall grand total.
-- - If desired for reporting, label NULLs with COALESCE (e.g., COALESCE(c.country, 'ALL COUNTRIES')).
