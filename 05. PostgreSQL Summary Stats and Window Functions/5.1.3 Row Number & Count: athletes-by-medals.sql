-- ============================================
-- 1. Task Description
-- Number (rank) Olympic athletes by how many medals they have earned.
-- First, aggregate medals per athlete, then assign row numbers in
-- descending order of total medals so that the top medalist is 1,
-- the second is 2, and so on.
--
-- 2. Topics Covered
-- - CTE (WITH) to stage an aggregation
-- - COUNT(*) to compute medals per athlete
-- - ROW_NUMBER() OVER (ORDER BY ...) for ranking by a metric
-- - Ordering output for readability
-- ============================================

-- Aggregate medals per athlete, then number athletes by total medals (descending)
WITH Athlete_Medals AS (
  SELECT
    Athlete,               -- athlete identifier/name
    COUNT(*) AS Medals     -- total medals earned
  FROM Summer_Medals
  GROUP BY Athlete
)
SELECT
  athlete,
  ROW_NUMBER() OVER (ORDER BY medals DESC) AS Row_N  -- 1 = most medals
FROM Athlete_Medals
ORDER BY medals DESC;  -- show highest medal counts first

-- Notes:
-- - ROW_NUMBER() assigns unique sequential numbers even when there are ties.
--   If you want tied athletes to share the same rank, consider RANK() or DENSE_RANK():
--     RANK()       -> 1, 2, 2, 4 (skips after ties)
--     DENSE_RANK() -> 1, 2, 2, 3 (no gaps after ties)
