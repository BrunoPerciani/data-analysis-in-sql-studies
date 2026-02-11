-- ============================================
-- 1. Task Description
-- Use DATE_TRUNC() to truncate rental_date timestamps to the day
-- level and aggregate the number of rentals per calendar day.
-- DATE_TRUNC('day', timestamp) returns a timestamp at midnight
-- for the given day (YYYY‑MM‑DD 00:00:00), allowing grouping at
-- daily precision.
--
-- 2. Topics Covered
-- - DATE_TRUNC() for timestamp truncation
-- - Daily aggregation of rental activity
-- - GROUP BY aliases or positional references
-- - COUNT() for event frequency
-- ============================================

SELECT 
    DATE_TRUNC('day', rental_date) AS rental_day,
    -- Count total number of rentals per truncated day
    COUNT(*) AS rentals
FROM rental
GROUP BY 1
ORDER BY rental_day;
