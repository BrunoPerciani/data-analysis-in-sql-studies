-- ============================================
-- 1. Task Description
-- Identify reigning champions by both gender and event in Athletics.
-- A reigning champion is a country whose athlete won both the current
-- edition and the previous edition for the same (Gender, Event) pair.
-- Use a window function partitioned by Gender and Event and ordered
-- by Year to fetch the previous champion for comparison.
--
-- Scope:
-- - Discipline: Athletics
-- - Events: 100M, 10000M
-- - Years: >= 2000
-- - Medal: Gold
--
-- 2. Topics Covered
-- - CTE (WITH) to isolate gold medalists for selected events/years
-- - DISTINCT to ensure one row per (Gender, Year, Event, Country)
-- - LAG() OVER (PARTITION BY Gender, Event ORDER BY Year) to get prior champion
-- - Ordering results for readable reporting
-- ============================================

WITH Athletics_Gold AS (
  SELECT DISTINCT
    Gender,
    Year,
    Event,
    Country
  FROM Summer_Medals
  WHERE
    Year >= 2000
    AND Discipline = 'Athletics'
    AND Event IN ('100M', '10000M')
    AND Medal = 'Gold'
)
SELECT
  Gender,
  Year,
  Event,
  Country AS Champion,
  -- Fetch the previous year's champion within the same (Gender, Event) partition
  LAG(Country) OVER (
    PARTITION BY Gender, Event
    ORDER BY Year ASC
  ) AS Last_Champion
FROM Athletics_Gold
ORDER BY Event ASC, Gender ASC, Year ASC;
