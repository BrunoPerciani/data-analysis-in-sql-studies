-- ============================================
-- 1. Task Description
-- Practice performing joins using the USING clause.
-- USING can be applied when both tables share a column
-- with the same name (in this case: code). Explore the
-- languages spoken in each country and determine which
-- are official versus unofficial languages.
--
-- 2. Topics Covered
-- - INNER JOIN with USING(column)
-- - Simplifying join syntax when column names match
-- - Selecting attributes from both tables
-- - Understanding official vs. unofficial languages
-- ============================================

-- Select country names, languages spoken, and whether they are official
SELECT 
    c.name AS country,
    l.name AS language,
    l.official
FROM countries AS c
INNER JOIN languages AS l
USING (code);  -- Match using the shared 'code' column
