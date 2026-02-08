-- ============================================
-- 1. Task Description
-- Use a self join on the populations table to compare each
-- country to itself across two points in time, in order to
-- visualize or compute the change in population from 2010
-- to 2015. Alias the same table as p1 and p2 and join on
-- country_code while offsetting years by 5.
--
-- 2. Topics Covered
-- - Self JOINs (joining a table to itself)
-- - Table aliasing (p1, p2) for clarity
-- - Temporal comparisons with an offset (year + 5)
-- - Selecting aligned metrics side-by-side
-- ============================================

-- Compare populations for the same country between 2010 and 2015
SELECT 
    p1.country_code,        -- country identifier
    p1.size AS size2010,    -- population size in 2010
    p2.size AS size2015     -- population size in 2015
FROM populations AS p1
INNER JOIN populations AS p2
  ON p1.country_code = p2.country_code   -- match the same country
-- Ensure p1 is always five years before p2
WHERE p1.year = 2010
  AND p2.year = p1.year + 5;
