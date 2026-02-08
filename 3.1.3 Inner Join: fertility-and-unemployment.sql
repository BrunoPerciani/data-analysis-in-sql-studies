-- ============================================
-- 1. Task Description
-- Join three related tables—countries, populations, and
-- economies—to return a unified dataset containing:
--   • country name
--   • fertility rate
--   • year
--   • unemployment rate
--
-- The goal is to study the relationship between fertility
-- rates and unemployment across countries and years.
--
-- 2. Topics Covered
-- - Multiple INNER JOINs
-- - Joining on matching country codes
-- - Combining demographic and economic indicators
-- - Aliasing tables for clarity
-- ============================================

-- Select fields from countries, populations, and economies
SELECT
    c.name,
    p.fertility_rate,
    e.year,
    e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
    ON c.code = p.country_code        -- match population data to country
INNER JOIN economies AS e
    USING (code);                     -- match economic data via shared 'code'
