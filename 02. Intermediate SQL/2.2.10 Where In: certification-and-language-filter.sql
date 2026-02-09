-- ============================================
-- 1. Task Description
-- Practice using the IN operator to filter rows
-- based on multiple possible values for a field.
-- The IN clause helps keep queries clean and
-- readable when checking several values.
-- The goal of this exercise is to return the
-- title, certification, and language of all films
-- that are certified NC-17 or R and are in English,
-- Italian, or Greek.
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - IN (multiple value matching)
-- - Combining IN with OR conditions
-- - Text-based filtering
-- ============================================

-- Find the title, certification, and language of all films
-- certified NC-17 or R that are in English, Italian, or Greek
SELECT title, certification, language
FROM films
WHERE language IN ('English', 'Italian', 'Greek')
  AND (certification = 'NC-17' OR certification = 'R');
``
