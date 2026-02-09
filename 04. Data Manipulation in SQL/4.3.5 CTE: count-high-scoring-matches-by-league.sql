-- ============================================
-- 1. Task Description
-- Clean up a previous “subquery in FROM” solution by using a
-- Common Table Expression (CTE). Build a list of matches that
-- had total goals >= 10, then count how many such matches each
-- league (country) had by joining the CTE to the league table.
--
-- 2. Topics Covered
-- - CTEs (WITH) to stage filtered data
-- - LEFT JOIN to retain leagues with zero qualifying matches
-- - Aggregation with COUNT()
-- - GROUP BY on a dimension attribute (league name)
-- ============================================

-- Set up your CTE: list of high-scoring matches (total goals >= 10)
WITH match_list AS (
    SELECT 
        country_id, 
        id
    FROM match
    WHERE (home_goal + away_goal) >= 10
)
-- Count high-scoring matches by league (country)
SELECT
    l.name AS league,
    COUNT(match_list.id) AS matches
FROM league AS l
-- Join the CTE to the league table using country_id
LEFT JOIN match_list 
  ON l.id = match_list.country_id
GROUP BY l.name
ORDER BY l.name;
