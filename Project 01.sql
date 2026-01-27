-- ============================================
-- Project Name: analyzing-students-mental-health
--
-- 1. Task Description
-- Explore and analyze the students data to see how the
-- length of stay (stay) impacts the average mental health
-- diagnostic scores of the international students present
-- in the study. Return a table with nine rows and five
-- columns (stay, count_int, average_phq, average_scs, average_as),
-- where averages are rounded to two decimals, counts reflect the
-- number of international students per stay group, and results
-- are sorted by stay in descending order.
--
-- Study context:
-- A Japanese international university surveyed students (2018),
-- finding that international students face higher mental health
-- risks than the general population, and that social connectedness
-- (SCS) and acculturative stress (ASISS) predict depression (PHQ-9).
--
-- 2. Topics Covered
-- - WHERE (row filtering)
-- - GROUP BY (group-level aggregation)
-- - COUNT() and AVG() (aggregate functions)
-- - ROUND() (formatting numeric output)
-- - ORDER BY (sorting results)
-- - Aliasing result columns
-- ============================================

-- Select stay and aggregated metrics for international students only.
-- Returns: 9 rows (expected), 5 columns with required aliases.
SELECT
    stay,
    COUNT(*) AS count_int,                 -- number of international students in each stay group
    ROUND(AVG(todep), 2) AS average_phq,   -- PHQ-9 average
    ROUND(AVG(tosc), 2) AS average_scs,    -- SCS average (social connectedness)
    ROUND(AVG(toas), 2) AS average_as      -- ASISS average (acculturative stress)
FROM students
WHERE inter_dom IN ('Inter')               -- filter to international students
GROUP BY stay
ORDER BY stay DESC;                        -- sort by length of stay (descending)
