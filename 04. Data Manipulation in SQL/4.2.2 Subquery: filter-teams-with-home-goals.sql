-- ============================================
-- 1. Task Description
-- Create a list of teams that have scored 8 or more goals
-- in a single home match. Use a subquery in the WHERE clause
-- to filter team_api_id values based on matches where the
-- home_goal count is at least 8. This demonstrates how to
-- use subqueries with their own filtering logic to drive
-- which rows are returned from an outer query.
--
-- 2. Topics Covered
-- - Scalar and list‑returning subqueries (IN)
-- - Filtering with conditions inside a subquery
-- - Understanding team–match relationships
-- - Selecting descriptive attributes from the team table
-- ============================================

SELECT
    -- Select the team long and short names
    team_long_name,
    team_short_name
FROM team
-- Subquery to filter for teams with 8 or more home goals
WHERE team_api_id IN (
    SELECT hometeam_id
    FROM match
    WHERE home_goal >= 8
);
