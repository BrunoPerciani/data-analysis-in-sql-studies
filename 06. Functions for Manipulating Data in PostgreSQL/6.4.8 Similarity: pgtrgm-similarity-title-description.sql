-- ============================================
-- 1. Task Description
-- Use the pg_trgm extension’s similarity() function to measure
-- the trigram-based similarity between two text fields: the film
-- title and the film description. This demonstrates how fuzzy
-- text matching can quantify how closely two strings resemble
-- each other. similarity() returns a value between 0 and 1,
-- where 1 means identical strings.
--
-- 2. Topics Covered
-- - similarity(text, text) from pg_trgm
-- - Fuzzy text matching and trigram comparison
-- - Selecting and comparing values across columns
-- ============================================

-- Select the title and description columns and measure similarity
SELECT 
    title,
    description,
    -- Calculate the trigram similarity score
    similarity(title, description) AS similarity_score
FROM film;
