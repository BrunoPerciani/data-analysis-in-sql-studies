-- ============================================
-- 1. Task Description
-- Compute the average number of Evanston 311 requests
-- created per day for each month, explicitly including
-- days with zero requests in the monthly average. Use a
-- generated daily date series to ensure missing dates
-- are represented with a count of 0.
--
-- 2. Topics Covered
-- - generate_series() to build a complete day calendar
-- - date_trunc('day'/'month') for temporal aggregation
-- - LEFT JOIN to include missing dates
-- - COALESCE() to treat NULL counts as zero
-- - AVG() to compute mean daily counts per month
-- ============================================

-- Generate a complete calendar of days and average daily counts by month,
-- counting zero-request days as 0 in the monthly average.
WITH all_days AS (
    -- generate series with all days from 2016-01-01 to 2018-06-30
    SELECT generate_series('2016-01-01'::date,
                           '2018-06-30'::date,
                           '1 day'::interval) AS date
),
daily_count AS (
    -- Subquery to compute daily counts present in the data
    SELECT
        date_trunc('day', date_created) AS day,
        COUNT(*) AS count
    FROM evanston311
    GROUP BY day
)
-- Aggregate daily counts by month using date_trunc; include missing days as 0
SELECT
    date_trunc('month', date) AS month,
    AVG(COALESCE(daily_count.count, 0)) AS average
FROM all_days
LEFT JOIN daily_count
  ON all_days.date = daily_count.day
GROUP BY month
ORDER BY month;
