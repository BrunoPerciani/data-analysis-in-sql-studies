-- ============================================
-- 1. Task Description
-- Practice filtering numeric values using the
-- WHERE clause. Filtering helps analyze specific
-- subsets of the data, such as movies within a
-- certain budget or rating range. The goal of
-- this exercise is to select films with fewer
-- than 1000 Facebook likes and limit the output
-- to 10 records.
--
-- 2. Topics Covered
-- - WHERE (numeric filtering)
-- - Comparison operators (<)
-- - LIMIT (restricting result set size)
-- - Basic SELECT usage
-- ============================================

-- Select film_id and facebook_likes for ten records with less than 1000 likes
SELECT film_id, facebook_likes
FROM reviews
WHERE facebook_likes < 1000
LIMIT 10;
