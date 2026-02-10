-- ============================================
-- 1. Task Description
-- Rank athletes from multiple countries (Japan and South Korea)
-- by the number of medals they earned since 2000, ensuring ranks
-- are assigned independently per country and without gaps after ties.
-- Only include athletes with more than one medal in the period.
--
-- 2. Topics Covered
-- - CTE (WITH) to stage per-athlete medal counts by country
-- - Filtering with WHERE and HAVING (>= 2000; medal count > 1)
-- - DENSE_RANK() with PARTITION BY for per-country rankings
-- - Ordering output for readability
-- ============================================

WITH Athlete_Medals AS (
  SELECT
    Country,
    Athlete,
    COUNT(*) AS Medals
  FROM Summer_Medals
  WHERE
    Country IN ('JPN', 'KOR')
    AND Year >= 2000
  GROUP BY Country, Athlete
  HAVING COUNT(*) > 1
)
SELECT
  Country,
  Athlete,
  -- Rank athletes in each country by medals (ties share the same rank; no gaps)
  DENSE_RANK() OVER (
    PARTITION BY Country
    ORDER BY Medals DESC
  ) AS Rank_N
FROM Athlete_Medals
ORDER BY Country ASC, Rank_N ASC, Athlete ASC;
