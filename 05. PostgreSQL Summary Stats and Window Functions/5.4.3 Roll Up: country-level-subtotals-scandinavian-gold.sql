-- ============================================
-- 1. Task Description
-- Count gold medals earned in 2004 by three Scandinavian countries
-- (Denmark, Norway, Sweden), broken down by gender. Also compute
-- country-level subtotals using ROLLUP, while ignoring gender-only
-- subtotals. Gender-level subtotals are irrelevant here because
-- the focus is on total medals per country.
--
-- 2. Topics Covered
-- - Conditional filtering (Year = 2004, gold medals only)
-- - GROUP BY with ROLLUP() to produce hierarchical subtotals
-- - How to ignore unwanted subtotal levels using WHERE or CASE logic
-- - Ordering for clean output
-- ============================================

-- Count the gold medals per country and gender
SELECT
  Country,
  Gender,
  COUNT(*) AS Gold_Awards
FROM Summer_Medals
WHERE
  Year = 2004
  AND Medal = 'Gold'
  AND Country IN ('DEN', 'NOR', 'SWE')
-- Generate Country-level subtotals (ROLLUP produces:
--  (Country, Gender), (Country), and ()
-- We keep only (Country, Gender) and (Country) levels)
GROUP BY Country, ROLLUP(Gender)
-- Remove the grand total row (where Country IS NULL)
HAVING Country IS NOT NULL
ORDER BY Country ASC, Gender ASC;
