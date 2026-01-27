-- ============================================
-- 1. Task Description
-- Combine multiple SQL concepts—WHERE, GROUP BY,
-- HAVING, ORDER BY, LIMIT, and aggregate functions—
-- to produce a concise, insight-rich summary.
-- The goal of this exercise is to return, for each
-- year after 1990, the average budget and average
-- gross of films where the average budget exceeds
-- 60 million, then sort by average gross (descending)
-- and keep only the top year.
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - GROUP BY (group-level aggregation)
-- - AVG() (aggregate function)
-- - HAVING (filtering aggregated groups)
-- - ORDER BY ... DESC (sorting by aggregated metric)
-- - LIMIT (restricting result set size)
-- - Alias usage in ORDER BY (ordering by selected aliases)
-- ============================================

-- For each release year after 1990, compute average budget and gross,
-- keep only years with avg budget > 60M, then return the top year by avg gross.
SELECT
  release_year,
  AVG(budget) AS avg_budget,
  AVG(gross)  AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
-- Order the results from highest to lowest average gross and limit to one
ORDER BY avg_gross DESC
LIMIT 1;
