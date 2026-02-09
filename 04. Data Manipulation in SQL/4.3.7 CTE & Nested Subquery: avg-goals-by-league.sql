-- ============================================
-- 1. Task Description
-- Use a CTE with a nested subquery to organize a calculation of
-- average goals per league for a specific period. The inner subquery
-- filters matches to the 2013/2014 season and the month of August,
-- the CTE computes total goals per match and carries the country_id,
-- and the outer query joins leagues to compute the average goals.
--
-- 2. Topics Covered
-- - CTEs (WITH) to improve readability and reuse
-- - Nested subqueries inside a CTE for precise filtering
-- - Aggregation (AVG) over a precomputed metric
-- - LEFT JOIN to retain leagues without qualifying matches
-- ============================================

-- Set up your CTE
WITH match_list AS (
    SELECT 
        country_id, 
        (home_goal + away_goal) AS goals
    FROM match
    -- Create a list of match IDs to filter data in the CTE
    WHERE id IN (
        SELECT id
        FROM match
        WHERE season = '2013/2014'
          AND EXTRACT(MONTH FROM date) = 8  -- August (use 8 to avoid leading-zero ambiguity)
    )
)
-- Select the league name and average of goals in the CTE
SELECT
    l.name AS league,
    AVG(match_list.goals) AS avg_goals
FROM league AS l
-- Join the CTE onto the league table using country_id
LEFT JOIN match_list
  ON l.id = match_list.country_id
GROUP BY l.name
ORDER BY l.name;
