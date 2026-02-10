-- ============================================
-- 1. Task Description
-- Compute a moving (sliding) maximum of gold medals earned by
-- Chinese athletes (since 2000), using a window frame that looks
-- back across the current row and the previous two rows. This lets
-- you compare each athlete’s medal count to the maximum among the
-- last three athletes in alphabetical order (including the current).
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per athlete
-- - Filtering by Country (CHN), Medal (Gold), and Year >= 2000
-- - Window frames with ROWS BETWEEN ... AND CURRENT ROW
-- - MAX() OVER (...) to compute moving maximums
-- - Ordering for deterministic frame definition
-- ============================================

WITH Chinese_Medals AS (
  SELECT
    Athlete,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country = 'CHN'
    AND Medal = 'Gold'
    AND Year >= 2000
  GROUP BY Athlete
)
SELECT
  -- Select the athletes and the medals they've earned
  Athlete,
  Medals,
  -- Moving maximum of the current row and the previous two rows (by athlete name)
  MAX(Medals) OVER (
    ORDER BY Athlete ASC
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS Max_Medals
FROM Chinese_Medals
ORDER BY Athlete ASC;
