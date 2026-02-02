-- ============================================
-- 1. Task Description
-- Explore how casting affects data values when converting
-- from one type to another. Casting can change how values
-- are stored and interpreted—for example, converting from
-- numeric with decimals to integer removes fractional values.
-- The goal of this exercise is to display the original value
-- of profits_change from the fortune500 table and a casted
-- version of that value as an integer.
--
-- 2. Topics Covered
-- - CAST() for explicit type conversion
-- - Changes to data when converting types
-- - Integer truncation behavior
-- - Using AS to alias cast results
-- ============================================

-- Select the original value and its integer-casted version
SELECT
    profits_change,
    CAST(profits_change AS int) AS profits_change_int
FROM fortune500;
