-- ============================================
-- 1. Task Description
-- Practice combining multiple conditions using
-- the AND operator within the WHERE clause.
-- This helps filter data by multiple criteria
-- simultaneously. The goal of this exercise is
-- to select all German-language films released
-- after 2000 and before 2010.
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - AND (combining multiple conditions)
-- - Range filters with comparison operators
-- - Basic SELECT usage
-- ============================================

-- Select all records for German-language films released after 2000 and before 2010
SELECT *
FROM films
WHERE (release_year > 2000 AND release_year < 2010)
  AND language = 'German';
