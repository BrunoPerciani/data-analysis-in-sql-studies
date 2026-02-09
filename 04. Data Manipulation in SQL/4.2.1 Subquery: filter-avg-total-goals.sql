-- ============================================
-- 1. Task Description
-- Use a scalar subquery in the WHERE clause to filter matches whose
-- total goals (home + away) are more than 3 times the overall average
-- total goals for the 2013/2014 season (table: matches_2013_2014).
-- This demonstrates how subqueries can provide dynamic thresholds
-- computed from the same dataset being filtered.
--
-- 2. Topics Covered
-- - Scalar subqueries in WHERE
-- - Aggregation inside subqueries (AVG on an expression)
-- - Derived filters using computed thresholds
-- - Basic SELECT with ordering for readability
-- ============================================

-- Select high-scoring matches (total goals > 3 × season average)
SELECT 
    date,
    home_goal,
    away_goal
FROM matches_2013_2014
WHERE (home_goal + away_goal) >
      (
        SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014
      )
ORDER BY date;  -- optional: chronological review
