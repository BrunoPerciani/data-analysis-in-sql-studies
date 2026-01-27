-- ============================================
-- 1. Task Description
-- Practice combining aggregate functions with the
-- WHERE clause to summarize specific subsets of
-- data. This allows deeper insight into trends,
-- financial metrics, and filtered groups of films.
-- The goal of this exercise is to calculate the
-- lowest gross among films released in 1994.
--
-- 2. Topics Covered
-- - MIN() (finding the lowest value)
-- - WHERE (filtering subsets of data)
-- - IN (matching one or more values)
-- - Combining filters with aggregation
-- ============================================

-- Calculate the lowest gross film in 1994
SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year IN (1994);
