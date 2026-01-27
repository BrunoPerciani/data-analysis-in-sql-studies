-- ============================================
-- 1. Task Description
-- Practice combining HAVING (to filter aggregated
-- groups) with ORDER BY (to sort the summarized
-- results). This improves interpretability by
-- highlighting which groups rank highest on a
-- chosen metric. The goal of this exercise is to
-- show which countries have the highest average
-- film budgets, keeping only those with an average
-- budget above one billion.
--
-- 2. Topics Covered
-- - GROUP BY (grouping rows)
-- - AVG() (aggregate function)
-- - HAVING (filtering aggregated groups)
-- - ORDER BY ... DESC (sorting by aggregated metric)
-- - Difference between WHERE vs. HAVING
-- ============================================

-- Select the country and average_budget from films
SELECT country,
       AVG(budget) AS average_budget
FROM films
-- Group by country
GROUP BY country
-- Filter to countries with an average_budget of more than one billion
HAVING AVG(budget) > 1000000000
-- Order by descending order of the aggregated budget
ORDER BY average_budget DESC;
