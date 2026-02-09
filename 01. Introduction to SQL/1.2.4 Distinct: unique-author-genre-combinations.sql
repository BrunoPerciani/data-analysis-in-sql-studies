-- ============================================
-- 1. Task Description
-- Practice using the DISTINCT keyword to return
-- unique values from the books table.
-- The goal of this exercise is to explore how
-- many different author–genre combinations are
-- represented in the dataset.
--
-- 2. Topics Covered
-- - DISTINCT (removing duplicate rows)
-- - Selecting multiple fields uniquely
-- - Basic query structure
-- ============================================

-- Select unique authors and genre combinations from the books table
SELECT DISTINCT author, genre
FROM books;
