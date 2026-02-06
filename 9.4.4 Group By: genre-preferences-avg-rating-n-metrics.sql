-- ============================================
-- 1. Task Description
-- Identify customer preferences for genres by evaluating
-- the average rating and engagement metrics per genre.
-- Focus on movies with sufficient rating activity
-- (at least 3 ratings per movie) and rentals in 2018
-- or later, to emphasize more reliable, recent feedback.
-- Return, for each genre: average rating, number of ratings,
-- total rentals, and number of distinct movies.
--
-- 2. Topics Covered
-- - Filtering with subqueries and HAVING
-- - Aggregations: AVG(), COUNT(), COUNT(DISTINCT)
-- - LEFT JOIN between fact (renting) and dimension (movies)
-- - Post-filtering by rental date to focus on recent activity
-- - Ordering by a computed metric (avg_rating) descending
-- ============================================

-- Customer preference for genres (movies with >= 3 ratings; rentals from 2018+)
SELECT
    m.genre,
    AVG(r.rating)                    AS avg_rating,   -- average customer rating within genre
    COUNT(r.rating)                  AS n_rating,     -- count of ratings contributing to the average
    COUNT(*)                         AS n_rentals,    -- total rentals in the period (includes NULL ratings)
    COUNT(DISTINCT m.movie_id)       AS n_movies      -- number of distinct movies per genre
FROM renting AS r
LEFT JOIN movies AS m
  ON m.movie_id = r.movie_id
WHERE r.movie_id IN (
    -- Keep only movies with sufficient rating activity (robustness)
    SELECT movie_id
    FROM renting
    GROUP BY movie_id
    HAVING COUNT(rating) >= 3
)
  AND r.date_renting >= '2018-01-01'  -- focus on recent customer behavior
GROUP BY m.genre
-- Order the table by decreasing average rating
ORDER BY avg_rating DESC;
