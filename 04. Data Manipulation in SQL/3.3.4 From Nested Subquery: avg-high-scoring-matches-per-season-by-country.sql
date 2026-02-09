-- ============================================
-- 1. Task Description
-- Nest a subquery in the FROM clause to compute, for each
-- country and season, the number of matches in which either team
-- scored at least 5 goals. Then, at the outer level, calculate
-- the average number of such high-scoring matches per season
-- by country.
--
-- 2. Topics Covered
-- - Nested subqueries (derived tables) in FROM
-- - Correlated logic via carrying keys (country_id, season)
-- - COUNT() per (country, season) then AVG() by country
-- - LEFT JOIN to retain countries with no qualifying matches
-- ============================================

SELECT
    c.name AS country,
    -- Average number of high-scoring matches (5+ goals by any team) per season
    AVG(outer_s.matches) AS avg_seasonal_high_scores
FROM country AS c
-- Join the per-country, per-season counts back to countries
LEFT JOIN (
    -- outer_s: one row per (country_id, season) with the count of high-scoring matches
    SELECT
        country_id,
        season,
        COUNT(id) AS matches
    FROM (
        -- inner_s: list of matches where either side scored >= 5 goals
        SELECT
            country_id,
            season,
            id
        FROM match
        WHERE home_goal >= 5 OR away_goal >= 5
    ) AS inner_s
    GROUP BY country_id, season
) AS outer_s
  ON c.id = outer_s.country_id
GROUP BY country
ORDER BY country;

-- Notes:
-- - AVG() ignores NULL, so countries with seasons without any high-scoring matches
--   will average over seasons that do have rows in outer_s. If you need to include
--   seasons with zero matches explicitly in the average, generate a complete
--   (country, season) grid and LEFT JOIN outer_s to it, COALESCE(matches, 0),
--   then AVG over that expanded set.
