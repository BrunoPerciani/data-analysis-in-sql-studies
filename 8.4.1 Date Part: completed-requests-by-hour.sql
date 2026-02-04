-- ============================================
-- 1. Task Description
-- Use the date_part() function to extract units of
-- time (such as hours, days, months) from timestamp
-- values in order to aggregate and analyze trends
-- in when Evanston 311 requests are submitted or
-- completed. In this exercise, the goal is to count
-- how many requests are completed during each hour
-- of the day.
--
-- 2. Topics Covered
-- - date_part('unit', timestamp) for time extraction
-- - GROUP BY on derived time units
-- - COUNT() for summarizing event frequencies
-- - ORDER BY for chronological presentation
-- ============================================

-- Count requests completed by hour of the day
SELECT
    date_part('hour', date_completed) AS hour,  -- extract the hour from timestamp
    COUNT(*) AS request_count                  -- count requests completed in that hour
FROM evanston311
GROUP BY hour
ORDER BY hour;
