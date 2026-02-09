-- ============================================
-- 1. Task Description
-- Use a correlated subquery with multiple conditions to retrieve
-- the highest-scoring match (by total goals) for each country in
-- each season. The correlation must match on both country_id and
-- season so that the per-country, per-season maximum is used as
-- the comparison baseline.
--
-- 2. Topics Covered
-- - Correlated subqueries referencing outer query columns
-- - Matching on multiple keys (country_id AND season)
-- - Aggregate comparisons with MAX(total goals)
-- - Handling potential ties (multiple matches can share the same max)
-- ============================================

SELECT 
    main.country_id,
    main.season,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE 
    -- Keep only matches that equal the per-country, per-season maximum total goals
    (main.home_goal + main.away_goal) =
    (
        SELECT MAX(sub.home_goal + sub.away_goal)
        FROM match AS sub
        -- Correlate on both country and season
        WHERE sub.country_id = main.country_id
          AND sub.season     = main.season
    )
ORDER BY main.country_id, main.season, main.date;

-- Notes:
-- - If multiple matches in the same country+season tie for the maximum total goals,
--   all such rows will be returned (one row per tied match).
-- - You can add team names by joining to the teams table and include a scoreline:
--   CONCAT(main.home_goal, '-', main.away_goal) AS scoreline.
