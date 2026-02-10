-- ============================================
-- 1. Task Description
-- Rank Olympic athletes based on how many medals they have earned.
-- Unlike ROW_NUMBER(), which gives unique row numbers even when values
-- are tied, RANK() assigns the same rank to athletes with the same
-- medal count. This produces correct competitive-style ranking.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per athlete
-- - COUNT() to compute the total medals earned
-- - RANK() window function for tie-aware ranking
-- - ORDER BY inside and outside the window for proper presentation
-- ============================================

WITH Athlete_Medals AS (
  SELECT
    Athlete,
    COUNT(*) AS Medals          -- total medals earned per athlete
  FROM Summer_Medals
  GROUP BY Athlete
)
SELECT
  Athlete,
  Medals,
  -- Rank athletes by medals earned (ties receive the same rank)
  RANK() OVER (ORDER BY Medals DESC) AS Rank_N
FROM Athlete_Medals
ORDER BY Medals DESC;
