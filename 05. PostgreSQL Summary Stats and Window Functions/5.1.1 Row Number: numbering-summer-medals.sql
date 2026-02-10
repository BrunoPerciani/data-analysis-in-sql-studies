-- ============================================
-- 1. Task Description
-- Use a window function to assign a row number to each record
-- in the Summer_Medals table. Numbering rows is the simplest
-- application of window functions and allows easy retrieval
-- of the nth row without requiring an existing sequential column.
--
-- 2. Topics Covered
-- - ROW_NUMBER() window function
-- - OVER() clause (no partition or ordering inside)
-- - Adding derived columns to a table
-- - Using ORDER BY on the generated row numbers
-- ============================================

SELECT
    *,
    -- Assign numbers to each row
    ROW_NUMBER() OVER () AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;
