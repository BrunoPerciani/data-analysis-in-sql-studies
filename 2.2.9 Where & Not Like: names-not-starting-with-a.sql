-- ============================================
-- 1. Task Description
-- Practice using the LIKE and NOT LIKE operators
-- to filter text values based on patterns.
-- LIKE allows matching strings using wildcards
-- (%) for multiple characters and (_) for a
-- single character. The goal of this exercise
-- is to select names that do not start with the
-- letter 'A'.
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - NOT LIKE (pattern exclusion)
-- - Wildcards: % and _
-- - Text-based filtering
-- ============================================

-- Select names that don't start with A
SELECT name
FROM people
WHERE name NOT LIKE 'A%';
