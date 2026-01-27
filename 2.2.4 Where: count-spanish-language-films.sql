-- ============================================
-- 1. Task Description
-- Practice filtering string values using the
-- WHERE clause. This is useful when analyzing
-- specific language categories or grouping films
-- by textual attributes. The goal of this
-- exercise is to count how many Spanish-language
-- films exist in the dataset.
--
-- 2. Topics Covered
-- - WHERE (string filtering)
-- - Equality comparison for text values
-- - COUNT() aggregation
-- - Basic SELECT usage
-- ============================================

-- Count the Spanish-language films
SELECT COUNT(*) AS count_spanish
FROM films
WHERE language = 'Spanish';
