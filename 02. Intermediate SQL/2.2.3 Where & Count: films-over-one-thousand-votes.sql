-- ============================================
-- 1. Task Description
-- Practice filtering numeric values using the
-- WHERE clause. Filtering helps analyze specific
-- subsets of data, such as movies within a
-- certain budget or rating range. The goal of
-- this exercise is to select records based on a
-- numeric threshold.
--
-- 2. Topics Covered
-- - WHERE (numeric filtering)
-- - Comparison operators (>=)
-- - COUNT() aggregation
-- - Basic SELECT usage
-- ============================================

-- Count the records with at least 100,000 votes
SELECT COUNT(*) AS films_over_100K_votes
FROM reviews
WHERE num_votes >= 100000;
