-- ============================================
-- 1. Task Description
-- Practice using column aliasing to rename fields
-- in the result set. Aliasing helps make results
-- clearer and more descriptive.
-- The goal of this exercise is to return the list
-- of unique authors with a more explicit column name.
--
-- 2. Topics Covered
-- - DISTINCT (unique selection)
-- - AS (column aliasing)
-- - Renaming fields for readability
-- ============================================

-- Select distinct authors and rename the column to unique_author
SELECT DISTINCT author AS unique_author
FROM books;
