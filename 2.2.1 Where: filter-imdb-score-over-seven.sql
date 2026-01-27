-- ============================================
-- 1. Task Description
-- Practice filtering numeric values using the
-- WHERE clause. Filtering allows you to analyze
-- subsets of data, such as films with the highest
-- ratings or biggest budgets. The goal of this
-- exercise is to select films with an IMDb score
-- greater than 7.0 from the reviews table.
--
-- 2. Topics Covered
-- - WHERE (filtering rows)
-- - Numeric comparison operators
-- - Basic SELECT usage
-- ============================================

-- Select film_id and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;
