-- ============================================
-- 1. Task Description
-- Count the number of matches played in each European country
-- for specific seasons by pivoting season counts into separate
-- columns using conditional aggregation with CASE WHEN.
-- This query returns the number of matches in 2012/2013 and
-- 2013/2014 per country.
--
-- 2. Topics Covered
-- - LEFT JOIN (retain all countries even if no matches)
-- - Conditional aggregation with CASE WHEN inside COUNT()
-- - GROUP BY on a dimension (country)
-- - Multi-column season pivot via conditional counts
-- ============================================

-- Count matches by country for selected seasons using CASE WHEN
SELECT 
    c.name AS country,
    -- Count matches in 2012/2013
    COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
    -- Count matches in 2013/2014
    COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014
FROM country AS c
LEFT JOIN match AS m
  ON c.id = m.country_id
GROUP BY country
ORDER BY country;

-- Notes:
-- - COUNT(expr) counts non-NULL values only, so the CASE returns
--   m.id for rows in the given season and NULL otherwise—perfect for
--   conditional tallying.
-- - LEFT JOIN ensures countries with zero matches still appear with
--   0 counts for the selected seasons.
-- - To add more seasons, append additional COUNT(CASE WHEN ...) columns,
--   e.g., COUNT(CASE WHEN m.season = '2014/2015' THEN m.id END) AS matches_2014_2015.
