-- ============================================
-- 1. Task Description
-- Determine the number of characters in the description column
-- of the film table. Character-length checks are useful for data
-- validation, enforcing formatting rules, UI display constraints,
-- and text‑processing workflows.
--
-- 2. Topics Covered
-- - CHAR_LENGTH() to compute string length
-- - Basic SELECT of multiple fields
-- - Simple text‑analysis SQL patterns
-- ============================================

SELECT 
    -- Select the title and description columns
    title,
    description,
    -- Determine the length of the description column
    CHAR_LENGTH(description) AS desc_len
FROM film;
