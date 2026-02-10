-- ============================================
-- 1. Task Description
-- Split athletes into top, middle, and bottom thirds based on
-- the number of medals they have earned. Use NTILE(3) to divide
-- the distribution of medal counts into three equally sized
-- groups. Only include athletes who have earned more than one
-- medal.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medal counts per athlete
-- - HAVING to filter athletes with > 1 medal
-- - NTILE(3) to split values into thirds (top/middle/bottom)
-- - ORDER BY medals DESC to ensure NTILE groups align with ranking
-- ============================================

WITH Athlete_Medals AS (
  SELECT 
    Athlete,
    COUNT(*) AS Medals       -- total medals earned
  FROM Summer_Medals
  GROUP BY Athlete
  HAVING COUNT(*) > 1        -- only keep multi‑medal athletes
)
SELECT
  Athlete,
  Medals,
  -- Split athletes into top, middle, and bottom thirds
  NTILE(3) OVER (ORDER BY Medals DESC) AS Third
FROM Athlete_Medals
ORDER BY Medals DESC, Athlete ASC;
