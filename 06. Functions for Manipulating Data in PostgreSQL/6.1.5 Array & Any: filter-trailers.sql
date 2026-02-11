-- ============================================
-- 1. Task Description
-- Filter films whose special_features ARRAY contains the value
-- 'Trailers', regardless of its index position. Unlike direct
-- indexing (e.g., special_features[1]), the ANY function checks
-- all elements of the ARRAY, returning rows where at least one
-- element matches the given value.
--
-- 2. Topics Covered
-- - ARRAY data types (TEXT[])
-- - ANY() operator for array membership testing
-- - Comparing scalar values to array elements in PostgreSQL
-- ============================================

SELECT
  title,
  special_features
FROM film
-- Use ANY() to test whether 'Trailers' appears in any position in the array
WHERE 'Trailers' = ANY (special_features);
