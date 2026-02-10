-- ============================================
-- 1. Task Description
-- Identify reigning champions by gender for the Javelin Throw event.
-- A reigning champion is a country whose athlete/team won both the
-- current year and the previous edition for the same gender. Use a
-- window function with PARTITION BY gender and an ORDER BY year to
-- fetch the previous champion within each gender track.
--
-- 2. Topics Covered
-- - CTE to isolate gold medalists for a specific event and time frame
-- - DISTINCT to ensure one row per (Gender, Year, Country)
-- - LAG() with PARTITION BY to compare within gender partitions
-- - Correct ordering for "previous year" logic (ORDER BY year)
-- ============================================

WITH Javelin_Gold AS (
  SELECT DISTINCT
    Gender,
    Year,
    Country
  FROM Summer_Medals
  WHERE
    Year >= 2000
    AND Event = 'Javelin Throw'
    AND Medal = 'Gold'
)
SELECT
  Gender,
  Year,
  Country AS Champion,
  -- Fetch the previous year's champion within the same gender
  LAG(Country) OVER (
    PARTITION BY Gender
    ORDER BY Year ASC
  ) AS Last_Champion
FROM Javelin_Gold
ORDER BY Gender ASC, Year ASC;
