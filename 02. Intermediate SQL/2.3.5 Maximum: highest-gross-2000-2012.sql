-- ============================================
-- 1. Task Description
-- Practice combining aggregate functions with the
-- WHERE clause to summarize specific subsets of
-- data. This technique allows for deeper insights
-- into financial performance and filtered groups
-- of films. The goal of this exercise is to find
-- the highest gross among films released between
-- 2000 and 2012 (inclusive).
--
-- 2. Topics Covered
-- - MAX() (finding the highest value)
-- - WHERE (filtering subsets of data)
-- - BETWEEN (inclusive range filtering)
-- - Combining filters with aggregation
-- ============================================

-- Calculate the highest gross film released between 2000–2012
SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;
