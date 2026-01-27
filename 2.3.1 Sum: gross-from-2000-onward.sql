-- ============================================
-- 1. Task Description
-- Practice combining aggregate functions with the
-- WHERE clause to summarize only a subset of data.
-- This is useful when analyzing financial metrics,
-- trends over specific time periods, or comparing
-- categories such as certifications or genres.
-- The goal of this exercise is to calculate the
-- total gross of films released in the year 2000
-- or later.
--
-- 2. Topics Covered
-- - SUM() (aggregating numeric values)
-- - WHERE (filtering subsets of data)
-- - Comparison operators (>=)
-- - Combining filters with aggregate functions
-- ============================================

-- Calculate the sum of gross from the year 2000 or later
SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;
