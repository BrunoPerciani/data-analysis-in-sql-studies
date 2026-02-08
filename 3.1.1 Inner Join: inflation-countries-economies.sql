-- ============================================
-- 1. Task Description
-- Practice joining tables using aliases and selecting
-- fields with explicit table qualification to avoid
-- ambiguity. Examine the inflation rate from the
-- economies table for the years 2010 and 2015 by
-- joining it with the countries table.
--
-- 2. Topics Covered
-- - INNER JOIN with table aliases
-- - Disambiguating column references (c.code vs e.code)
-- - Selecting specific years using a filter
-- - Clean SELECT lists with clear aliases
-- ============================================

-- Select fields with aliases and join countries to economies
SELECT 
    c.code AS country_code,   -- explicit alias for clarity
    c.name,                   -- country name from countries
    e.year,                   -- year from economies
    e.inflation_rate          -- metric of interest
FROM countries AS c
INNER JOIN economies AS e
    ON c.code = e.code        -- join on country code
-- Focus on the two target years mentioned in the task
WHERE e.year IN (2010, 2015)
ORDER BY c.name, e.year;
