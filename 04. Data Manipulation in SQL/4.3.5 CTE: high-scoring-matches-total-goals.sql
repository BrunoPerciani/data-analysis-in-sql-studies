-- ============================================
-- 1. Task Description
-- Use a Common Table Expression (CTE) to organize a query that
-- lists details about very high-scoring matches (total goals ≥ 10).
-- The CTE joins matches to leagues and precomputes total goals,
-- making the outer query simpler and easier to read.
--
-- 2. Topics Covered
-- - CTEs (WITH) for clearer organization
-- - JOIN inside a CTE
-- - Precomputing expressions (total_goals)
-- - Filtering outer results using CTE columns
-- - Optional ordering for reviewability
-- ============================================

-- Set up your CTE
WITH match_list AS (
  -- Select the league name, date, home, away goals, and total goals
  SELECT 
    l.name AS league, 
    m.date, 
    m.home_goal, 
    m.away_goal,
    (m.home_goal + m.away_goal) AS total_goals
  FROM match AS m
  LEFT JOIN league AS l 
    ON m.country_id = l.id
)
-- Select the league, date, home, and away goals from the CTE
SELECT 
  league, 
  date, 
  home_goal, 
  away_goal
FROM match_list
-- Filter by total goals
WHERE total_goals >= 10
ORDER BY date, league;
