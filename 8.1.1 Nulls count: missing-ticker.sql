-- ============================================
-- 1. Task Description
-- Determine which columns in the fortune500 table
-- contain the most missing (NULL) values. This exercise
-- focuses on comparing missing values in two fields:
-- ticker and industry. The goal of this step is to count
-- the number of NULL values in the ticker column using
-- an aggregate expression that compares total rows to
-- the count of non-null values.
--
-- 2. Topics Covered
-- - NULL handling in SQL
-- - COUNT(*) vs COUNT(column)
--   * COUNT(*) counts all rows
--   * COUNT(column) counts only non-null values
-- - Calculating missing values using:
--     COUNT(*) - COUNT(column)
-- ============================================

-- Count the number of null values in the ticker column
SELECT COUNT(*) - COUNT(ticker) AS missing
FROM fortune500;
