-- ============================================
-- 1. Task Description
-- Use a subquery in the SELECT list to create a calculated
-- column that compares each league’s average total goals to
-- the overall average total goals in the 2013/2014 season.
-- Specifically, subtract the overall season average (scalar
-- subquery) from each league’s average.
--
-- 2. Topics Covered
-- - Subqueries in SELECT for scalar calculations
-- - LEFT JOIN to include leagues even if they have no matches
-- - Aggregation with AVG() and arithmetic on aggregates
-- - Season-level filtering and grouping by league
-- - ROUND() for presentation
-- ============================================

SELECT
    -- Select the league name and average goals scored
    l.name AS league,
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    -- Subtract the 2013/2014 overall average from each league's average
    ROUND(
        AVG(m.home_goal + m.away_goal) -
        (
            SELECT AVG(home_goal + away_goal)
            FROM match
            WHERE season = '2013/2014'
        ),
        2
    ) AS diff
FROM league AS l
LEFT JOIN match AS m
  ON l.country_id = m.country_id
-- Only include 2013/2014 results for the league-level averages
WHERE m.season = '2013/2014'
GROUP BY l.name
ORDER BY l.name;

-- Notes:
-- - The scalar subquery computes a single overall-average value for the entire
--   2013/2014 season. It is independent of the outer query’s GROUP BY.
-- - Using LEFT JOIN keeps all leagues in scope; the WHERE clause on m.season
--   effectively requires matching rows for 2013/2014 to compute league averages.
--   If you want to keep leagues with no 2013/2014 matches, move the season
--   predicate into the JOIN (e.g., ON ... AND m.season = '2013/2014') and
--   then handle NULLs with COALESCE in the SELECT.
