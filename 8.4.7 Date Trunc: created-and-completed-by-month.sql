-- ============================================
-- 1. Task Description
-- Investigate why requests in the "Rodents- Rats" category
-- average over 64 days to resolve. This multi-step analysis
-- includes:
-- 1) Checking the distribution of completion times (you can
--    use date_trunc on intervals for bucketing).
-- 2) Evaluating how excluding outliers influences averages.
-- 3) Assessing whether busier months take longer (correlation
--    between average completion time and monthly request volume).
-- 4) Comparing monthly counts of created vs. completed requests.
--
-- This specific query addresses Step 4: compare the number of
-- "Rodents- Rats" requests created per month to the number
-- completed per month.
--
-- 2. Topics Covered
-- - date_trunc('month', timestamp) for month-level aggregation
-- - CTEs (WITH) to structure multi-step logic
-- - INNER JOIN to align monthly created and completed counts
-- - Grouped counts and time-based ordering
-- ============================================

-- Compute monthly created vs. completed counts for "Rodents- Rats"
WITH created AS (
    SELECT
        date_trunc('month', date_created) AS month,
        COUNT(*) AS created_count
    FROM evanston311
    WHERE category = 'Rodents- Rats'
    GROUP BY month
),
completed AS (
    SELECT
        date_trunc('month', date_completed) AS month,
        COUNT(*) AS completed_count
    FROM evanston311
    WHERE category = 'Rodents- Rats'
    GROUP BY month
)
SELECT
    created.month,
    created_count,
    completed_count
FROM created
INNER JOIN completed
  ON created.month = completed.month
ORDER BY created.month;
