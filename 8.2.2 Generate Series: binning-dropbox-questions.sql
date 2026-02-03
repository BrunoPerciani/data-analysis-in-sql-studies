-- ============================================
-- 1. Task Description
-- Summarize the distribution of the number of daily
-- Stack Overflow questions tagged "dropbox" by binning
-- the data into fixed-width ranges. Use generate_series()
-- to create contiguous bins, LEFT JOIN the daily counts
-- into those bins, and count how many days fall in each bin.
--
-- 2. Topics Covered
-- - CTEs (WITH clauses) to organize intermediate steps
-- - generate_series(from, to, step) to build numeric bins
-- - LEFT JOIN to keep all bins (even empty ones)
-- - Range joins (value BETWEEN lower and upper)
-- - GROUP BY and COUNT() to summarize per bin
-- - ORDER BY to sort bins ascending
-- ============================================

-- Build 50-wide bins from 2,200 to 3,100 counts,
-- subset the tag 'dropbox', then count days per bin.
WITH bins AS (
    SELECT
        generate_series(2200, 3050, 50) AS lower,
        generate_series(2250, 3100, 50) AS upper
),
dropbox AS (  -- daily question counts for the 'dropbox' tag
    SELECT question_count
    FROM stackoverflow
    WHERE tag = 'dropbox'
)
-- Select binned ranges and how many days fall into each range
SELECT
    lower,
    upper,
    COUNT(question_count) AS days_in_bin
FROM bins
LEFT JOIN dropbox
    ON question_count >= lower
   AND question_count <  upper
GROUP BY lower, upper
ORDER BY lower;
