-- ============================================
-- 1. Task Description
-- Use date_trunc() to aggregate timestamps at the
-- month level in order to compute the average number
-- of Evanston 311 requests created per day for each
-- month in the dataset. Unlike EXTRACT(), date_trunc()
-- preserves larger date components, making it ideal
-- for grouping by months, weeks, or years.
--
-- Steps:
-- 1. Truncate request creation timestamps to the day
--    to compute the number of requests per calendar day.
-- 2. Aggregate those daily counts by truncating to month.
-- 3. Compute the average daily request count within each month.
-- 4. Ignore days with zero requests by design (subquery only
--    includes days present in the table).
--
-- 2. Topics Covered
-- - date_trunc('unit', timestamp) for temporal grouping
-- - Subqueries for daily aggregation
-- - AVG() to compute mean daily counts per month
-- - GROUP BY + ORDER BY on truncated timestamps
-- ============================================

-- Aggregate daily request counts and compute monthly averages
SELECT
    date_trunc('month', day) AS month,   -- truncate to month level
    AVG(count) AS avg_daily_requests     -- average requests per active day
FROM (
    -- Subquery: count requests per day
    SELECT
        date_trunc('day', date_created) AS day,  -- truncate to day
        COUNT(*) AS count                        -- number of requests that day
    FROM evanston311
    GROUP BY day
) AS daily_count
GROUP BY month
ORDER BY month;
