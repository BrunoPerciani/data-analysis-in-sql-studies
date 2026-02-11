-- ============================================
-- 1. Task Description
-- Create a formatted field called film_category by concatenating:
--   • the category name in UPPERCASE,
--   • a colon and space,
--   • the film title converted to title case using INITCAP().
--
-- Also convert the film description to lowercase using LOWER().
-- Join film → film_category → category to combine the necessary data.
--
-- 2. Topics Covered
-- - String concatenation with ||
-- - Case transformation functions:
--     UPPER(), LOWER(), INITCAP()
-- - INNER JOIN across film/category mapping tables
-- ============================================

SELECT 
    -- Concatenate uppercase category name with title‑cased film title
    UPPER(c.name) || ': ' || INITCAP(f.title) AS film_category,
    -- Convert the film description to lowercase
    LOWER(f.description) AS description
FROM film AS f
INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id
INNER JOIN category AS c
    ON fc.category_id = c.category_id;
