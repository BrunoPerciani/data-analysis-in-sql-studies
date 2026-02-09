-- ============================================
-- 1. Task Description
-- Compute pairwise Pearson correlations among
-- profits, profits_change, and revenues_change
-- from the Fortune 500 dataset. Build the result
-- in steps by inserting rows into a temporary
-- table and then return a rounded correlation
-- matrix-like output.
--
-- 2. Topics Covered
-- - CREATE TEMP TABLE (session-scoped tables)
-- - INSERT INTO ... SELECT (append query results)
-- - corr(x, y) (Pearson correlation coefficient)
-- - Type casting and ROUND() for presentation
-- - Building matrix-style outputs from rows
-- ============================================

-- Start fresh: drop temp table if it exists in this session
DROP TABLE IF EXISTS correlations;

-- Create a temporary table to accumulate correlation rows
CREATE TEMP TABLE correlations AS
SELECT
  'profits'::varchar AS measure,
  corr(profits, profits)               AS profits,
  corr(profits, profits_change)        AS profits_change,
  corr(profits, revenues_change)       AS revenues_change
FROM fortune500;

-- Insert row for profits_change as the anchor variable
INSERT INTO correlations
SELECT
  'profits_change'::varchar AS measure,
  corr(profits_change, profits)        AS profits,
  corr(profits_change, profits_change) AS profits_change,
  corr(profits_change, revenues_change) AS revenues_change
FROM fortune500;

-- Insert row for revenues_change as the anchor variable
INSERT INTO correlations
SELECT
  'revenues_change'::varchar AS measure,
  corr(revenues_change, profits)        AS profits,
  corr(revenues_change, profits_change) AS profits_change,
  corr(revenues_change, revenues_change) AS revenues_change
FROM fortune500;

-- Final select: return a rounded view of the correlation matrix
SELECT
  measure,
  ROUND(profits::numeric, 2)          AS profits,
  ROUND(profits_change::numeric, 2)   AS profits_change,
  ROUND(revenues_change::numeric, 2)  AS revenues_change
FROM correlations
ORDER BY measure;  -- optional: alphabetical row order
