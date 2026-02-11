-- ============================================
-- 1. Task Description
-- Use the LIKE operator to filter film titles that contain the
-- substring 'GOLD'. The % wildcard allows searching for patterns
-- at any position in the text. This is commonly used for text
-- exploration, data cleaning, and partial matching in SQL queries.
--
-- 2. Topics Covered
-- - LIKE operator for pattern matching
-- - Wildcard % to match zero or more characters
-- - Filtering text results using partial patterns
-- ============================================

SELECT *
FROM film
-- Select only records that contain the word 'GOLD'
WHERE title LIKE '%GOLD%';
