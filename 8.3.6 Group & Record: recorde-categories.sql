-- ============================================
-- 1. Task Description
-- Group and recode values in the evanston311.category field
-- to better aggregate similar request types. First, create a
-- temporary mapping table (recode) that standardizes categories
-- to the text before the dash ('-'), with a few explicit fixes
-- for exceptional cases. Then, join the original table to this
-- mapping to count requests per standardized category and order
-- results by frequency.
--
-- 2. Topics Covered
-- - split_part() to extract substrings by delimiter
-- - RTRIM() to remove trailing whitespace
-- - CREATE TEMP TABLE to stage recode mappings
-- - UPDATE for targeted recodes/exceptions
-- - LEFT JOIN ... USING() to apply recodes
-- - GROUP BY + COUNT() to summarize
-- - ORDER BY to rank results
-- ============================================

-- Code from previous step (reproducible setup)
DROP TABLE IF EXISTS recode;

-- Build a temporary recode table mapping original categories to standardized labels
CREATE TEMP TABLE recode AS
  SELECT DISTINCT
         category,
         RTRIM(split_part(category, '-', 1)) AS standardized
  FROM evanston311;

-- Hand-tune specific standardized values for known variants
UPDATE recode
   SET standardized = 'Trash Cart'
 WHERE standardized LIKE 'Trash%Cart';

UPDATE recode
   SET standardized = 'Snow Removal'
 WHERE standardized LIKE 'Snow%Removal%';

-- Mark several deprecated categories as UNUSED
UPDATE recode
   SET standardized = 'UNUSED'
 WHERE standardized IN (
   'THIS REQUEST IS INACTIVE...Trash Cart',
   '(DO NOT USE) Water Bill',
   'DO NOT USE Trash',
   'NO LONGER IN USE'
);

-- Select the recoded categories and the count of each
SELECT
  recode.standardized,
  COUNT(*) AS request_count
FROM evanston311
LEFT JOIN recode USING (category)        -- join on the shared category column
GROUP BY standardized
ORDER BY request_count DESC;             -- show most common first
