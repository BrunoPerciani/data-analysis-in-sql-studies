-- ============================================
-- 1. Task Description
-- Determine the longest time gap between consecutive
-- Evanston 311 requests being submitted. Use a window
-- function to compare each request timestamp against the
-- previous one in chronological order, compute the gaps,
-- and return the row(s) with the maximum gap.
--
-- 2. Topics Covered
-- - LAG() window function (accessing the previous row)
-- - ORDER BY within OVER() to define row order
-- - Interval arithmetic (timestamp differences)
-- - WITH (CTE) for stepwise clarity
-- - Filtering by the maximum aggregated value (subquery)
-- ============================================

-- Compute the gaps between consecutive requests and return the maximum gap
WITH request_gaps AS (
    SELECT
        date_created,
        -- Previous request timestamp (chronological order)
        LAG(date_created) OVER (ORDER BY date_created) AS previous,
        -- Gap between this request and the previous one
        date_created - LAG(date_created) OVER (ORDER BY date_created) AS gap
    FROM evanston311
)
-- Select the row(s) with the maximum gap
SELECT *
FROM request_gaps
WHERE gap = (
    SELECT MAX(gap)
    FROM request_gaps
);
