-- ============================================
-- 1. Task Description
-- Compute a moving (sliding) maximum of annual gold medals
-- earned by Scandinavian countries (DEN, NOR, FIN, SWE, ISL).
-- Use a window frame to take the maximum of the current year
-- and the immediately following year for each row.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per year
-- - Window frames with ROWS BETWEEN ... AND ... for sliding windows
-- - MAX() OVER (...) to compute moving maximums
-- - Chronological ordering for interpretability
-- ============================================

WITH Scandinavian_Medals AS (
  SELECT
    Year,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country IN ('DEN', 'NOR', 'FIN', 'SWE', 'ISL')
    AND Medal = 'Gold'
  GROUP BY Year
)
SELECT
  -- Select each year's medals
  Year,
  Medals,
  -- Moving maximum: max of the current and next year's medals
  MAX(Medals) OVER (
    ORDER BY Year ASC
    ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING
  ) AS Max_Medals
FROM Scandinavian_Medals
ORDER BY Year ASC;
