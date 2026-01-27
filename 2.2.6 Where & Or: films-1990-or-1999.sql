-- ============================================
-- 1. Task Description
-- Practice using the OR operator to filter rows
-- that meet at least one of multiple conditions.
-- OR is especially useful when selecting values
-- from different categories, years, or ranges.
-- The goal of this first step is to retrieve the
-- title and release year of films released in
-- either 1990 or 1999.
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - OR (evaluating multiple conditions)
-- - Equality comparison
-- - Basic SELECT usage
-- ============================================

-- Find the title and year of films from 1990 or 1999
SELECT title, release_year
FROM films
WHERE release_year = 1990
   OR release_year = 1999;
