-- ============================================
-- 1. Task Description
-- Use the LEAD() window function to "peek into the future" and, for
-- each year’s women’s Discus Throw gold medalist (since 2000), fetch
-- the champion three editions later. This allows comparing the current
-- champion to a future champion in a single row.
--
-- 2. Topics Covered
-- - CTE (WITH) to isolate event-specific gold medalists
-- - DISTINCT to ensure one row per (Year, Athlete)
-- - LEAD(value, offset) OVER (ORDER BY ...) for forward-looking fetch
-- - Chronological ordering for correct window frame
-- ============================================

WITH Discus_Medalists AS (
  SELECT DISTINCT
    Year,
    Athlete
  FROM Summer_Medals
  WHERE Medal = 'Gold'
    AND Event = 'Discus Throw'
    AND Gender = 'Women'
    AND Year >= 2000
)
SELECT
  -- For each year, fetch the current and the champion 3 editions later
  Year,
  Athlete,
  LEAD(Athlete, 3) OVER (ORDER BY Year ASC) AS Future_Champion
FROM Discus_Medalists
ORDER BY Year ASC;
