-- ============================================
-- 1. Task Description
-- Use CASE inside AVG() to derive fractions: compute, for each
-- country, the fraction of tied games (home_goal = away_goal) in
-- the 2013/2014 and 2014/2015 seasons. Conditional expressions
-- return 1 for ties and 0 for non-ties within each season; AVG()
-- of those indicators yields the proportion of ties.
--
-- 2. Topics Covered
-- - LEFT JOIN (retain all countries even if no matches)
-- - Conditional aggregation with CASE inside AVG()
-- - Deriving proportions/fractions from 1/0 indicators
-- - GROUP BY on a dimension (country)
-- ============================================

SELECT 
    c.name AS country,
    -- Fraction of tied games in 2013/2014:
    -- Return 1 for ties, 0 for non-ties; NULL for other seasons (ignored by AVG)
    AVG(
        CASE
            WHEN m.season = '2013/2014' AND m.home_goal = m.away_goal THEN 1
            WHEN m.season = '2013/2014' AND m.home_goal <> m.away_goal THEN 0
            ELSE NULL
        END
    ) AS ties_2013_2014,
    -- Fraction of tied games in 2014/2015:
    AVG(
        CASE
            WHEN m.season = '2014/2015' AND m.home_goal = m.away_goal THEN 1
            WHEN m.season = '2014/2015' AND m.home_goal <> m.away_goal THEN 0
            ELSE NULL
        END
    ) AS ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
  ON c.id = m.country_id
GROUP BY country
ORDER BY country;

-- Notes:
-- - AVG() ignores NULLs, so seasons not matching the CASE return NULL and do not
--   affect the fraction. If a country has no matches in a season, the AVG() result
--   will be NULL for that season.
-- - Using '<>' for inequality is ANSI SQL; equivalent to '!=' in many dialects.
