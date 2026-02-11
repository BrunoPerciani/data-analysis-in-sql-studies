-- ============================================
-- 1. Task Description
-- Use the levenshtein() function (from the fuzzystrmatch extension)
-- to compare the film title to a misspelled search string:
--     'JET NEIGHBOR'
-- The levenshtein distance represents the number of edits
-- (insertions, deletions, substitutions) required to transform
-- one string into the other. Lower values indicate closer matches.
--
-- This technique is useful in search applications, typo‑tolerant
-- matching, and data cleaning tasks where exact matches may fail.
--
-- 2. Topics Covered
-- - levenshtein(string1, string2) function
-- - Fuzzy string matching / typo handling
-- - Ordering results by distance to find best matches
-- ============================================

-- Select the title and description columns and compute the Levenshtein distance
SELECT  
    title, 
    description, 
    -- Calculate the levenshtein distance between the film title and search string
    levenshtein(title, 'JET NEIGHBOR') AS distance
FROM film
ORDER BY distance;
