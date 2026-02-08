-- ============================================
-- 1. Task Description
-- Practice converting a LEFT JOIN into an equivalent
-- RIGHT JOIN. The goal is to list all countries along
-- with their languages (if any), ensuring the result
-- includes every country even if it has no associated
-- language record.
--
-- 2. Topics Covered
-- - RIGHT JOIN using USING(code)
-- - Understanding join directionality and equivalence
-- - Preserving all rows from the right-hand table
-- - Ordering results by the language column
-- ============================================

-- Modify this query to use RIGHT JOIN instead of LEFT JOIN
SELECT
    countries.name AS country,
    languages.name AS language,
    percent
FROM languages
RIGHT JOIN countries          -- keep all rows from countries
USING (code)
ORDER BY language;
