-- ============================================
-- 1. Task Description
-- Add a subquery in the SELECT list to compare each stage’s
-- average total goals (home + away) during the 2012/2013 season
-- to the overall season average. Filter results to show only
-- stages whose average exceeds the overall average.
--
-- This exercise builds on:
--  - a subquery in FROM (stage-level averages), and
--  - a scalar subquery in SELECT (overall season average),
--  - combined with a scalar subquery in WHERE for filtering.
--
-- 2. Topics Covered
-- - Subqueries in SELECT (scalar comparisons)
-- - Subqueries in FROM (derived tables)
-- - Using aggregated expressions in subqueries
-- - Filtering based on subquery results
-- ============================================

SELECT 
    -- Select the stage and its average goals from the derived table
    stage,
    ROUND(s.avg_goals, 2) AS avg_goal,
    -- Subquery in SELECT: overall average goals in 2012/2013
    (
        SELECT AVG(home_goal + away_goal)
        FROM match
        WHERE season = '2012/2013'
    ) AS overall_avg
FROM 
    -- Derived table computing average goals per stage in 2012/2013
    (
        SELECT
            stage,
            AVG(home_goal + away_goal) AS avg_goals
        FROM match
        WHERE season = '2012/2013'
        GROUP BY stage
    ) AS s
WHERE 
    -- Filter stages whose average exceeds the overall season average
    s.avg_goals >
    (
        SELECT AVG(home_goal + away_goal)
        FROM match
        WHERE season = '2012/2013'
    )
ORDER BY avg_goal DESC;
