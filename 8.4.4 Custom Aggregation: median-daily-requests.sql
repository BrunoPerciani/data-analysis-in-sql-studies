-- ============================================
-- 1. Task Description
-- Find the median number of Evanston 311 requests per day
-- in each six-month period from 2016-01-01 to 2018-06-30.
-- Build custom aggregation periods using generate_series()
-- to create six-month bins, compute daily counts with a
-- complete day series (including zero-count days), and
-- then take the median daily count per bin.
--
-- 2. Topics Covered
-- - generate_series() to build custom time bins
-- - LEFT JOIN with a full date series to include zero-count days
-- - date_trunc / casting to ::date for day-level alignment
-- - percentile_disc(0.5) WITHIN GROUP for medians
-- - GROUP BY and ORDER BY on bin boundaries
-- ============================================

-- Build six-month bins (lower/upper) and daily counts,
-- then compute the median daily request count per bin.
WITH bins AS (
    SELECT
        generate_series('2016-01-01'::timestamp,
                        '2018-01-01'::timestamp,
                        '6 months'::interval) AS lower,
        generate_series('2016-07-01'::timestamp,
                        '2018-07-01'::timestamp,
                        '6 months'::interval) AS upper
),
daily_counts AS (
    -- Create a complete calendar of days and count requests per day
    SELECT
        day,
        COUNT(e.date_created) AS count
    FROM (
        SELECT generate_series('2016-01-01'::date,
                               '2018-06-30'::date,
                               '1 day'::interval)::date AS day
    ) AS daily_series
    LEFT JOIN evanston311 e
      ON daily_series.day = e.date_created::date
    GROUP BY day
)
-- Return the median daily count per six-month bin
SELECT
    lower,
    upper,
    percentile_disc(0.5) WITHIN GROUP (ORDER BY count) AS median
FROM bins
LEFT JOIN daily_counts
  ON day >= lower
 AND day <  upper
GROUP BY lower, upper
ORDER BY lower;
