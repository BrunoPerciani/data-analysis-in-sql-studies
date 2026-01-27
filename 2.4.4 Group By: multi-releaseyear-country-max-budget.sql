-- ============================================
-- 1. Task Description
-- Practice using GROUP BY across multiple fields
-- and combine it with ORDER BY to summarize data
-- at a more granular level. Grouping by more than
-- one column helps compare metrics across categories
-- and time simultaneously. The goal of this exercise
-- is to find the maximum budget for each (year, country)
-- combination and sort the results by year and country.
--
-- 2. Topics Covered
-- - GROUP BY (grouping by multiple fields)
-- - MAX() (aggregate function)
-- - ORDER BY (sorting grouped results)
-- - Multi-dimensional summarization
-- ============================================

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year,
       country,
       MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
