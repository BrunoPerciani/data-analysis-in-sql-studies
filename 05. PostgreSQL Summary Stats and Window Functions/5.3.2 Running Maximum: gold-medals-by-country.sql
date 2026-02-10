-- ============================================
-- 1. Task Description
-- Compute, for three countries (China, South Korea, Japan),
-- the maximum number of gold medals earned so far (up to each
-- year) since 2000. This helps identify years when a country
-- set or matched its medals record by comparing the current
-- year's medals to the running maximum so far.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per (Year, Country)
-- - Filtering by Country, Medal type (Gold), and Year >= 2000
-- - MAX() OVER (PARTITION BY ...) with ORDER BY for running max
-- - Chronological ordering for clear trend inspection
-- ============================================

WITH Country_Medals AS (
  SELECT
    Year,
    Country,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country IN ('CHN', 'KOR', 'JPN')
    AND Medal = 'Gold'
    AND Year >= 2000
  GROUP BY Year, Country
)
SELECT
  -- Return the max medals earned so far per country (running maximum)
  Year,
  Country,
  Medals,
  MAX(Medals) OVER (
    PARTITION BY Country
    ORDER BY Year ASC
  ) AS Max_Medals
FROM Country_Medals
ORDER BY Country ASC, Year ASC;
