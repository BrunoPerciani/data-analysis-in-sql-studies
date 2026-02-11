-- ============================================
-- 1. Task Description
-- Truncate the description text for each film so that only the
-- first 50 characters are returned. Truncation is useful when
-- preparing previews, summaries, UI-limited fields, or when 
-- generating excerpts for reports or applications.
--
-- 2. Topics Covered
-- - LEFT(string, n) to extract the first n characters
-- - Basic string truncation for preview fields
-- ============================================

SELECT 
    -- Select the first 50 characters of the description column
    LEFT(description, 50) AS short_desc
FROM film AS f;
