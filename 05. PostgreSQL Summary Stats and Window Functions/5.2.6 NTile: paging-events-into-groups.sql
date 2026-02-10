-- ============================================
-- 1. Task Description
-- Split the 666 distinct Summer Olympics event names into
-- approximately equal-sized “pages” so they can be analyzed
-- chunk by chunk. Use the NTILE() window function to assign
-- each event to one of 111 groups (pages) when ordered
-- alphabetically.
--
-- 2. Topics Covered
-- - DISTINCT subquery to deduplicate event names
-- - NTILE(n) OVER (ORDER BY ...) to create n buckets
-- - Window ordering to define bucket assignment
-- - Simple paging strategy for iterative analysis
-- ============================================

WITH Events AS (
  SELECT DISTINCT Event
  FROM Summer_Medals
)
SELECT
  -- Split the distinct events into 111 approximately equal groups
  Event,
  NTILE(111) OVER (ORDER BY Event ASC) AS Page
FROM Events
ORDER BY Event ASC;
