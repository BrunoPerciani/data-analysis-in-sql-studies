-- ============================================
-- 1. Task Description
-- Practice using the ROUND() function with a
-- negative decimal parameter. Negative values
-- round numbers to the nearest tens, hundreds,
-- thousands, etc., which is useful when high
-- granularity is unnecessary for decision-making.
-- The goal of this exercise is to calculate the
-- average film budget and round it to the nearest
-- thousand dollars.
--
-- 2. Topics Covered
-- - AVG() (computing average values)
-- - ROUND() with negative precision
-- - Rounding to broader units (hundreds, thousands)
-- - Combining aggregate functions with rounding
-- ============================================

-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget), -3) AS avg_budget_thousands
FROM films;
