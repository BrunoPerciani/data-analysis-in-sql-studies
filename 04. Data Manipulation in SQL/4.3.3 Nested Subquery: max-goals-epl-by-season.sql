-- ============================================
-- 1. Task Description
-- Compare, for each season, the maximum total goals scored in any match
-- across all leagues with the maximum total goals scored in the England
-- Premier League (EPL) during that same season. Use a nested subquery in
-- the SELECT list that references the outer query’s season, and filters
-- matches to those whose country belongs to the EPL.
--
-- 2. Topics Covered
-- - Nested subqueries in SELECT
-- - Correlation on a column from the outer query (season)
-- - Aggregation with MAX() over an expression (home_goal + away_goal)
-- - Filtering by a league via an inner subquery on the league table
-- - GROUP BY to produce one row per season
-- ============================================

SELECT
    season,
    -- Max total goals in any match for this season (all leagues)
    MAX(home_goal + away_goal) AS max_goals,
    -- Max total goals in an England Premier League match for the same season
    (
        SELECT MAX(home_goal + away_goal)
        FROM match
        WHERE season = main.season
          AND country_id IN (
              SELECT country_id
              FROM league
              WHERE name = 'England Premier League'
          )
    ) AS pl_max_goals
FROM match AS main
GROUP BY season
ORDER BY season;
