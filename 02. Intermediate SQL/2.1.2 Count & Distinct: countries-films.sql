-- ============================================
-- 1. Task Description
-- Practice using the DISTINCT keyword together
-- with COUNT() to determine how many unique values
-- exist in a particular field. In this exercise,
-- the goal is to find out how many distinct
-- countries are represented in the films table.
--
-- 2. Topics Covered
-- - DISTINCT (retrieving unique values)
-- - COUNT(DISTINCT field) (counting unique entries)
-- - Basic aggregation
-- ============================================

-- Count the distinct countries from the films table
SELECT COUNT(DISTINCT country) AS count_distinct_countries
FROM films;
