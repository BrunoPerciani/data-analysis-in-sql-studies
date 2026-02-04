-- ============================================
-- 1. Task Description
-- Display a shortened preview of long description
-- values from the evanston311 table. If the text
-- exceeds 50 characters, show only the first 50
-- characters followed by '...'. Otherwise, show
-- the full description. Limit to rows where the
-- description starts with the word 'I'.
--
-- 2. Topics Covered
-- - length() (string length)
-- - LEFT() (substring from start)
-- - CASE WHEN (conditional logic)
-- - String concatenation (||)
-- - LIKE pattern matching
-- ============================================

-- Select the first 50 chars when length is greater than 50; else show the full text.
SELECT
  CASE
    WHEN length(description) > 50
      THEN LEFT(description, 50) || '...'
    ELSE description
  END AS description_preview
FROM evanston311
-- Limit to descriptions that start with the word 'I'
WHERE description LIKE 'I %'
ORDER BY description;
