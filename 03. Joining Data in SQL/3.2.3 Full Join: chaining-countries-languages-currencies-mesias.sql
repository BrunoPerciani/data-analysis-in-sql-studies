-- ============================================
-- 1. Task Description
-- Retrieve country‑level information for regions whose names
-- begin with “M…esia” (Melanesia, Micronesia, etc.) and enrich
-- it with corresponding language and currency information.
-- Since languages and currencies live in separate tables,
-- perform two consecutive FULL JOINs so that:
--   • all countries in the region appear,
--   • countries with no language/currency data still appear,
--   • language or currency rows without matching country codes
--     also appear (FULL JOIN behavior).
--
-- 2. Topics Covered
-- - FULL JOIN chaining (joining 3+ tables)
-- - USING(code) for simplified join syntax
-- - Selecting attributes across multiple dimensions
-- - Pattern matching with LIKE
-- ============================================

SELECT
    c1.name AS country,
    c1.region,
    l.name AS language,
    c2.basic_unit,
    c2.frac_unit
FROM countries AS c1
-- Full join with languages (alias l)
FULL JOIN languages AS l
USING (code)
-- Full join with currencies (alias c2)
FULL JOIN currencies AS c2
USING (code)
-- Filter to regions that begin with 'M...esia' (Melanesia, Micronesia)
WHERE region LIKE 'M%esia';
