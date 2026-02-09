-- ============================================
-- 1. Task Description
-- Compute summary statistics (mean and median) of
-- assets for Fortune 500 companies, grouped by sector.
-- Use AVG() to compute the mean, and use the
-- percentile_disc(0.5) WITHIN GROUP (ORDER BY ...)
-- function to compute the median. Finally, sort the
-- results by the mean asset value.
--
-- 2. Topics Covered
-- - GROUP BY (aggregating by sector)
-- - AVG() (mean calculation)
-- - percentile_disc() WITHIN GROUP (median calculation)
-- - ORDER BY (sorting results)
-- - Comparing central tendency measures
-- ============================================

-- Compute mean and median assets by sector
SELECT
    sector,                                                -- group identifier
    AVG(assets) AS mean,                                   -- mean assets
    percentile_disc(0.5) WITHIN GROUP (ORDER BY assets)    -- median assets
        AS median
FROM fortune500
GROUP BY sector                                            -- compute stats per sector
ORDER BY mean;                                             -- sort by mean assets
