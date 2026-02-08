-- ============================================
-- 1. Task Description
-- Perform a set operation using UNION ALL to stack records
-- from the economies and populations tables without removing
-- duplicates. Return all country-year combinations from both
-- tables and sort the final output by code and year.
--
-- 2. Topics Covered
-- - UNION ALL (preserve duplicates when stacking result sets)
-- - Ensuring column alignment (code/year vs. country_code/year)
-- - ORDER BY applied to the combined output
-- ============================================

-- Select country code and year from economies
SELECT
    code,
    year
FROM economies

-- Stack with country_code/year from populations (duplicates allowed)
UNION ALL

SELECT
    country_code AS code,
    year
FROM populations

ORDER BY code, year;
