-- ============================================
-- 1. Task Description
-- Analyze how the average completion time for requests
-- varies depending on the day of the week when they were
-- created. Use to_char() to extract the day name and
-- EXTRACT(DOW) to order days chronologically rather than
-- alphabetically. Compute the average duration between
-- request creation and completion for each weekday.
--
-- 2. Topics Covered
-- - to_char(timestamp, 'day') for weekday names
-- - EXTRACT(DOW FROM timestamp) for numeric weekday ordering
-- - Interval arithmetic (date_completed - date_created)
-- - GROUP BY on expressions and aliases
-- - ORDER BY using numeric weekday values
-- ============================================

-- Select day of week and average completion duration by creation day
SELECT
    to_char(date_created, 'day') AS day,                 -- weekday name (padded)
    AVG(date_completed - date_created) AS duration       -- average time to complete
FROM evanston311
-- Group by both the textual name and numeric weekday index
GROUP BY
    day,
    EXTRACT(DOW FROM date_created)
-- Order chronologically by weekday index (0 = Sunday, 6 = Saturday)
ORDER BY
    EXTRACT(DOW FROM date_created);
