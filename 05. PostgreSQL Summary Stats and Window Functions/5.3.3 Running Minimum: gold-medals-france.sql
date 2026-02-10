-- ============================================
-- 1. Task Description
-- Compute, for France (FRA), the minimum number of gold medals
-- earned so far (up to each year) since 2000. This running minimum
-- helps identify whether a given year matched or set a new low point
-- relative to prior years in the period.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per year
-- - Filtering by Country (FRA), Medal (Gold), and Year >= 2000
-- - MIN() OVER (ORDER BY ...) as a running minimum window function
-- - Chronological ordering for clear interpretation
-- ============================================

WITH France_Medals AS (
  SELECT
    Year,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country = 'FRA'
    AND Medal = 'Gold'
    AND Year >= 2000
  GROUP BY Year
)
SELECT
  Year,
  Medals,
  -- Running minimum of gold medals across years (up to current row)
  MIN(Medals) OVER (ORDER BY Year ASC) AS Min_Medals
FROM France_Medals
ORDER BY Year ASC;
