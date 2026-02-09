-- ============================================
-- 1. Task Description
-- Use the EXCEPT set operation to return all city names
-- that do NOT appear as country names. This operation 
-- subtracts the set of country names from the set of city 
-- names, returning only distinct values present in cities 
-- but absent from countries.
--
-- 2. Topics Covered
-- - EXCEPT (set subtraction)
-- - Distinct output guaranteed by EXCEPT
-- - Ensuring both SELECT queries output the same column structure
-- ============================================

-- Return all cities that do not have the same name as a country
SELECT name
FROM cities
EXCEPT
SELECT name
FROM countries
ORDER BY name;
