-- ============================================
-- 1. Task Description
-- Practice using the COUNT() function to count
-- records in a table. COUNT(*) returns the total
-- number of rows, while COUNT(field_name) counts
-- only non‑missing values in a specific field.
-- The goal of this exercise is to count the total
-- number of records in the people table.
--
-- 2. Topics Covered
-- - COUNT(*) (counting all rows)
-- - COUNT(field) (counting non-null values)
-- - Basic aggregation
-- ============================================

-- Count the number of records in the people table
SELECT COUNT(*) AS count_records
FROM people;
