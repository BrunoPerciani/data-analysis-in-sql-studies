-- ============================================
-- 1. Task Description
-- Use COALESCE to substitute missing values in the
-- fortune500.industry column with the sector value,
-- and fall back to 'Unknown' if both are NULL.
-- Then, find the most common (mode) industry by
-- counting occurrences and returning the top result.
--
-- 2. Topics Covered
-- - COALESCE() (handling NULLs with fallback values)
-- - COUNT() (frequency counting)
-- - GROUP BY (aggregating by category)
-- - ORDER BY ... DESC (ranking by frequency)
-- - LIMIT (keeping the top result)
-- ============================================

-- Use coalesce to replace NULL industry with sector (or 'Unknown'),
-- then count occurrences to find the most common industry.
SELECT
  COALESCE(industry, sector, 'Unknown') AS industry2,
  COUNT(*) AS total_count             -- count rows per resolved industry
FROM fortune500
GROUP BY industry2
ORDER BY total_count DESC             -- sort by frequency, highest first
LIMIT 1;                              -- keep only the most common
