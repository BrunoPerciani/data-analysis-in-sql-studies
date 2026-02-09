-- ============================================
-- 1. Task Description
-- Practice using a correlated subquery to flag extreme outlier matches
-- per country: return matches where the total goals (home + away) are
-- greater than three times the average total goals for that same country.
-- The subquery is correlated on country_id so that the comparison baseline
-- is computed per-country, not globally.
--
-- 2. Topics Covered
-- - Correlated subqueries (subquery references main query columns)
-- - Country-level baselines via correlation on country_id
-- - Aggregate comparisons for outlier detection
-- - Basic SELECT with filtering
-- ============================================

SELECT 
    -- Select fields from the main match table
    main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM match AS main
WHERE 
    -- Filter the main query by a correlated subquery:
    -- Keep matches whose total goals exceed 3x the country-level average.
    (main.home_goal + main.away_goal) >
    (
        SELECT 3 * AVG(sub.home_goal + sub.away_goal)
        FROM match AS sub
        -- Correlate by country: compute the average within the same country
        WHERE sub.country_id = main.country_id
    )
ORDER BY main.country_id, main.date;
