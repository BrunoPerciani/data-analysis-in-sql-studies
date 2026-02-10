-- ============================================
-- 1. Task Description
-- Rank countries by the number of gold medals in the 2000 Olympics,
-- then return the top 3 countries as a single comma-separated string.
-- The output should look like:
--   USA, RUS, AUS
--
-- 2. Topics Covered
-- - CTEs (WITH) to stage aggregations and rankings
-- - COUNT(*) to compute medals per country
-- - RANK() window function for tie-aware ranking
-- - STRING_AGG() to compress multiple rows into one CSV string
-- ============================================

WITH Country_Medals AS (
  SELECT
    Country,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE Year = 2000
    AND Medal = 'Gold'
  GROUP BY Country
),
Country_Ranks AS (
  SELECT
    Country,
    RANK() OVER (ORDER BY Medals DESC) AS Rank
  FROM Country_Medals
)
-- Compress the top-3 ranked countries into a single comma-separated string
SELECT STRING_AGG(Country, ', ' ORDER BY Rank, Country) AS top_3_countries_2000
FROM Country_Ranks
WHERE Rank <= 3;
