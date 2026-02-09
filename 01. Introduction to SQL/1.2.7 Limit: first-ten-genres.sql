-- ============================================
-- 1. Task Description
-- Practice using the LIMIT clause to restrict
-- the number of rows returned from a query.
-- Limiting results is useful for testing queries
-- or previewing data without retrieving full tables.
-- The goal of this exercise is to return the first
-- 10 genres from the books table.
--
-- 2. Topics Covered
-- - LIMIT (restricting output size)
-- - Basic SELECT usage
-- - Previewing sample data
-- ============================================

-- Select the first 10 genres from the books table
SELECT genre
FROM books
LIMIT 10;
