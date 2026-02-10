-- ============================================
-- 1. Task Description
-- Number the distinct Olympic years in ascending order to determine
-- in which year the nth Summer Olympics were held. The Summer Olympics
-- dataset spans from 1896 to 2012, but the table may contain multiple
-- rows per year, so a DISTINCT list is required before applying
-- ROW_NUMBER().
--
-- 2. Topics Covered
-- - ROW_NUMBER() window function
-- - Using a subquery to deduplicate values before numbering
-- - Ordering years in ascending sequence
-- - Applying window functions to derived tables
-- ============================================

SELECT
    Year,
    -- Assign numbers to each year
    ROW_NUMBER() OVER () AS Row_N
FROM (
    SELECT DISTINCT year
    FROM summer_medals
    ORDER BY year ASC
) AS years
ORDER BY year ASC;
