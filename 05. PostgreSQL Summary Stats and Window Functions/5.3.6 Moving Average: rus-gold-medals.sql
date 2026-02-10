-- ============================================
-- 1. Task Description
-- Calculate a 3-year moving average of gold medals earned by Russia
-- (RUS) in the Summer Olympics, starting from the year 1980. Use a
-- window frame to average the current year and the previous two years,
-- which helps visualize performance trends over time.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per year
-- - Filtering by country (RUS), medal type (Gold), and year >= 1980
-- - AVG() OVER (...) with a ROWS frame for moving averages
-- - Chronological ordering for time-series analysis
-- ============================================

WITH Russian_Medals AS (
  SELECT
    Year,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country = 'RUS'
    AND Medal = 'Gold'
    AND Year >= 1980
  GROUP BY Year
)
SELECT
  Year,
  Medals,
  -- Calculate the 3-year moving average (current year + previous 2 years)
  AVG(Medals) OVER (
    ORDER BY Year ASC
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS Medals_MA
FROM Russian_Medals
ORDER BY Year ASC;
