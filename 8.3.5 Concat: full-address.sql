-- ============================================
-- 1. Task Description
-- Concatenate the house number (house_num) and street
-- columns from the evanston311 table to form a full
-- address. Use CONCAT() to combine values with a space
-- in between, and apply LTRIM() to remove any leading
-- spaces in cases where house_num is NULL or empty.
--
-- 2. Topics Covered
-- - CONCAT() for string concatenation
-- - Handling NULL values in concatenation
-- - LTRIM() to remove leading whitespace
-- - Basic SELECT usage for text processing
-- ============================================

-- Concatenate house_num, a space, and street, trimming any leading whitespace
SELECT
    LTRIM(CONCAT(house_num, ' ', street)) AS address
FROM evanston311;
