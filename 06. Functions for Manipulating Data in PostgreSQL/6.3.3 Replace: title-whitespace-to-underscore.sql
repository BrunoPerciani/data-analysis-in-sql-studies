-- ============================================
-- 1. Task Description
-- Replace whitespace characters in film titles with underscores.
-- This is a common string-cleaning technique used when preparing
-- fields for export, filenames, URLs, or machine-readable formats.
--
-- 2. Topics Covered
-- - REPLACE() string function
-- - Basic SELECT string transformation
-- ============================================

SELECT 
    -- Replace whitespace in the film title with an underscore
    REPLACE(title, ' ', '_') AS title
FROM film;
