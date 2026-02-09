-- ============================================
-- 1. Task Description
-- Clean the street values in the evanston311 table by
-- removing leading house numbers, extra punctuation, and
-- trimming any leading/trailing spaces. This first-pass
-- standardization aims to isolate the street name itself.
--
-- 2. Topics Covered
-- - TRIM() with a character set
-- - Text cleaning and normalization
-- - DISTINCT to inspect unique cleaned values
-- - ORDER BY for reviewability
-- ============================================

-- Show original vs. cleaned street values
SELECT DISTINCT
       street,
       -- Trim off spaces, digits, and characters (# / .) from both ends
       TRIM(street, ' 0123456789#/.') AS cleaned_street
FROM evanston311
ORDER BY street;
