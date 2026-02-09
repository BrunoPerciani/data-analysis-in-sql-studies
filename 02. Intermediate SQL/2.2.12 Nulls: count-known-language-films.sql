-- ============================================
-- 1. Task Description
-- Practice working with NULL values in SQL.
-- NULL represents missing or unknown data.
-- The goal of this exercise is to count how many
-- films have a known (non‑NULL) language value
-- in the films table.
--
-- 2. Topics Covered
-- - WHERE (filtering rows)
-- - IS NOT NULL (checking non-missing values)
-- - COUNT() aggregation
-- - Understanding NULL behavior in SQL
-- ============================================

-- Count the number of films we have language data for
SELECT COUNT(*) AS count_language_known
FROM films
WHERE language IS NOT NULL;
