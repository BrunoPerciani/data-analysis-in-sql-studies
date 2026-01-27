-- ============================================
-- 1. Task Description
-- Practice using the HAVING clause to filter
-- grouped results. Unlike WHERE (which filters
-- rows before grouping), HAVING filters groups
-- after aggregation. The goal of this exercise
-- is to identify which countries have the most
-- varied film certifications by counting the
-- distinct certifications per country and keeping
-- only those with more than 10 distinct values.
--
-- 2. Topics Covered
-- - GROUP BY (grouping rows)
-- - COUNT(DISTINCT ...) (counting unique values)
-- - HAVING (filtering aggregated groups)
-- - Difference between WHERE vs. HAVING
-- ============================================

-- Select the country and distinct count of certification as certification_count
SELECT country,
       COUNT(DISTINCT certification) AS certification_count
FROM films
-- Group by country
GROUP BY country
-- Filter results to countries with more than 10 different certifications
HAVING COUNT(DISTINCT certification) > 10;
