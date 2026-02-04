-- ============================================
-- 1. Task Description
-- Explore how well the structured category field
-- captures the unstructured description text in
-- evanston311. Find inquiries whose description
-- mentions “trash” or “garbage” but whose category
-- does NOT include those words. Return the most
-- frequent categories for such cases.
--
-- 2. Topics Covered
-- - ILIKE / LIKE (pattern matching; case-insensitive match)
-- - Wildcards: % (zero or more characters)
-- - Text filtering with negation (NOT ILIKE / NOT LIKE)
-- - GROUP BY with COUNT() to summarize categories
-- - ORDER BY and LIMIT to show top categories
-- ============================================

-- Count rows per category where description mentions trash/garbage
-- but category does not. Use ILIKE for case-insensitive matching.
SELECT
  category,
  COUNT(*) AS category_count
FROM evanston311
WHERE
  (description ILIKE '%trash%' OR description ILIKE '%garbage%')
  -- Exclude categories that themselves mention these terms (case-insensitive)
  AND category NOT ILIKE '%trash%'
  AND category NOT ILIKE '%garbage%'
GROUP BY category                       -- summarize by category
ORDER BY category_count DESC            -- most frequent first
LIMIT 10;                               -- top 10 categories
