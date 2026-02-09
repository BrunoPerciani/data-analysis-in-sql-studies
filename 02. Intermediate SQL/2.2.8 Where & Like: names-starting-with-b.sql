-- ============================================
-- 1. Task Description
-- Practice using the LIKE and NOT LIKE operators
-- to filter text values based on patterns.
-- LIKE supports wildcard matching using % for
-- multiple characters and _ for a single character.
-- The goal of this exercise is to select all names
-- that start with the letter 'B'.
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - LIKE (pattern matching)
-- - Wildcards: % and _
-- - Text-based filtering
-- ============================================

-- Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';
