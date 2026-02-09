-- ============================================
-- 1. Task Description
-- Combine two economy snapshots—economies2015 and economies2019—
-- using a set operation. Use UNION to stack all records from both
-- tables vertically while automatically removing duplicates.
-- Then order the final result by country code and year.
--
-- 2. Topics Covered
-- - UNION (set operation that removes duplicates)
-- - Requirements for UNION: same number and order of columns
-- - Stacking tables representing different years
-- - ORDER BY applied to the final combined output
-- ============================================

-- Select all fields from economies2015
SELECT *
FROM economies2015

-- Set operation: stack 2015 and 2019 data, removing duplicates
UNION

-- Select all fields from economies2019
SELECT *
FROM economies2019

-- Order the final combined set
ORDER BY code, year;
