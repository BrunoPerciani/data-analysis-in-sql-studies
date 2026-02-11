-- ============================================
-- 1. Task Description
-- Combine and refine earlier string‑manipulation techniques to:
--   • create a formatted film_category field by concatenating the
--     uppercase category name with the film title, and
--   • truncate the film description to 50 characters and remove
--     any trailing whitespace using TRIM().
--
-- This demonstrates integrating LEFT() truncation with TRIM() to
-- clean up partial-word breaks and extra spaces that appear after
-- truncation.
--
-- 2. Topics Covered
-- - CONCAT() for formatted string building
-- - UPPER() and title handling
-- - LEFT() for string truncation
-- - TRIM() to remove trailing whitespace from truncated text
-- - INNER JOIN across film → film_category → category
-- ============================================

SELECT 
    -- Concatenate the uppercase category name and the film title
    CONCAT(UPPER(c.name), ': ', f.title) AS film_category,

    -- Truncate description to 50 characters, then TRIM trailing whitespace
    TRIM(LEFT(f.description, 50)) AS film_desc
FROM film AS f
INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id
INNER JOIN category AS c
    ON fc.category_id = c.category_id;
