-- ============================================
-- 1. Task Description
-- Use a LEFT JOIN between countries and economies to compute
-- the average GDP per capita by region for the year 2010.
-- Then sort the results in descending order of average GDP
-- per capita and return only the top 10 regions.
--
-- 2. Topics Covered
-- - LEFT JOIN to retain regions even if some countries
--   have missing economic data
-- - AVG() to compute average GDP per capita
-- - Filtering by year
-- - GROUP BY region
-- - ORDER BY with LIMIT to return the top values
-- ============================================

-- Average GDP per capita by region in 2010 (top 10)
SELECT
    region,
    AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING (code)
WHERE year = 2010
GROUP BY region
ORDER BY avg_gdp DESC     -- descending order
LIMIT 10;                 -- show only the first 10 records
