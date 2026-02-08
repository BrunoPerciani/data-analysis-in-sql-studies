-- ============================================
-- 1. Task Description
-- Use INTERSECT to return all names that appear in both
-- the cities and countries tables. This identifies cases
-- where a city shares the same name as a country.
-- INTERSECT returns only the distinct rows common to both
-- result sets.
--
-- 2. Topics Covered
-- - INTERSECT (set operation for shared values)
-- - Matching column output for set operations
-- - Distinctness guaranteed by INTERSECT
-- ============================================

-- Return all cities with the same name as a country
SELECT name
FROM cities
INTERSECT
SELECT name
FROM countries;
