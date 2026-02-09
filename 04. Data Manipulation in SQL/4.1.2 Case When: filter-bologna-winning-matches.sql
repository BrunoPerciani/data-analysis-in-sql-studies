-- ============================================
-- 1. Task Description
-- Generate a list of matches won by Italy’s Bologna team using
-- a CASE expression as a filter inside the WHERE clause.
-- The CASE categorizes rows you care about (Bologna wins) and
-- excludes the rest by checking that the CASE result is NOT NULL.
--
-- 2. Topics Covered
-- - CASE expression for conditional categorization
-- - Using CASE inside WHERE to filter rows
-- - Filtering wins whether Bologna is home or away
-- - Basic SELECT with ordering
-- ============================================

-- Return Bologna's winning matches (home or away) by filtering on a CASE expression
SELECT
    season,
    date,
    home_goal,
    away_goal
FROM matches_italy
WHERE
    -- Keep only rows where Bologna won (as home or as away)
    CASE
        -- Bologna as home team and scored more than the opponent
        WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
        -- Bologna as away team and scored more than the opponent
        WHEN awayteam_id = 9857 AND away_goal > home_goal THEN 'Bologna Win'
        -- All other matches (not a Bologna win) implicitly return NULL
    END IS NOT NULL
ORDER BY date;
