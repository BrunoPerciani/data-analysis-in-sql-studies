-- ============================================
-- 1. Task Description
-- Extract the first word from each street value in the
-- evanston311 dataset using split_part(), in order to
-- identify the most common street names regardless of
-- street suffix (e.g., “St”, “Street”, “Rd”, “Road”).
-- Then, count occurrences of each extracted street name
-- and return the top 20 most frequent names.
--
-- 2. Topics Covered
-- - split_part(string, delimiter, index) for tokenizing strings
-- - GROUP BY aggregation
-- - COUNT() to summarize frequencies
-- - ORDER BY to rank results
-- - LIMIT to restrict output
-- ============================================

-- Select the first word of the street value and count occurrences
SELECT
    split_part(street, ' ', 1) AS street_name,   -- extract first word before space
    COUNT(*) AS street_count                     -- count of occurrences
FROM evanston311
GROUP BY street_name
ORDER BY street_count DESC
LIMIT 20;
