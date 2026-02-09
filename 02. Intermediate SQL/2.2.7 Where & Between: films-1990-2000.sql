-- ============================================
-- 1. Task Description
-- Practice using the BETWEEN operator together
-- with the WHERE clause to filter values within
-- a numeric range. BETWEEN is inclusive, meaning
-- both boundary values are included. The goal of
-- this step is to retrieve the title and release
-- year of films released between 1990 and 2000.
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - BETWEEN (inclusive range filtering)
-- - Basic SELECT usage
-- - Working with year ranges
-- ============================================

-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
