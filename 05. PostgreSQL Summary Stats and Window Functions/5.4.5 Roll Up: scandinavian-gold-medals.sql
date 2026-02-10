-- ============================================
-- 1. Task Description
-- Clean up the breakdown of Scandinavian gold medals in 2004 by
-- replacing NULL values (introduced by ROLLUP subtotals) with
-- meaningful text labels. This makes subtotal and grand-total rows
-- easier to interpret in reports or exports.
--
-- 2. Topics Covered
-- - GROUP BY ROLLUP(country, gender) for hierarchical subtotals
-- - COALESCE() to replace NULLs with descriptive text
-- - Conditional filtering for Country and Year
-- - Clear ordering for readability
-- ============================================

SELECT
  -- Replace NULL grouping values with readable labels
  COALESCE(Country, 'All countries') AS Country,
  COALESCE(Gender, 'All genders')    AS Gender,
  COUNT(*) AS Awards
FROM Summer_Medals
WHERE
  Year = 2004
  AND Medal = 'Gold'
  AND Country IN ('DEN', 'NOR', 'SWE')
GROUP BY ROLLUP (Country, Gender)
ORDER BY Country ASC, Gender ASC;
