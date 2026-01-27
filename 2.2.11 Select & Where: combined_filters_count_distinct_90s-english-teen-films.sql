-- ============================================
-- 1. Task Description
-- Combine multiple SQL concepts—COUNT(), DISTINCT,
-- WHERE, BETWEEN, AND, IN—to filter and aggregate
-- results. The goal is to count the number of
-- unique film titles from the 1990s that are in
-- English and suitable for teens (G, PG, PG-13).
--
-- 2. Topics Covered
-- - COUNT(DISTINCT ...) (counting unique values)
-- - WHERE (row filtering)
-- - BETWEEN (inclusive range filtering)
-- - AND (combining multiple conditions)
-- - IN (matching against a list)
-- - Text and numeric filters together
-- ============================================

-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years between 1990 and 1999 (inclusive)
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
  AND language = 'English'
-- Narrow it down to G, PG, and PG-13 certifications
  AND certification IN ('G', 'PG', 'PG-13');
