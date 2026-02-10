-- ============================================
-- 1. Task Description
-- Compute the running total (cumulative sum) of gold medals earned
-- by U.S. athletes since the year 2000. Window functions allow you
-- to calculate cumulative metrics without grouping the result set,
-- enabling row-level detail alongside aggregate trends.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per athlete
-- - Filtering by country, medal type, and year
-- - SUM() OVER (ORDER BY ...) for cumulative totals
-- - ORDER BY outside the window to format final output
-- ============================================

WITH Athlete_Medals AS (
  SELECT
    Athlete,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country = 'USA'
    AND Medal = 'Gold'
    AND Year >= 2000
  GROUP BY Athlete
)
SELECT
  -- Calculate the running total of athlete medals
  Athlete,
  Medals,
  SUM(Medals) OVER (
      ORDER BY Athlete ASC
  ) AS Max_Medals
FROM Athlete_Medals
ORDER BY Athlete ASC;
