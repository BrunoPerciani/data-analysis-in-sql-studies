-- ============================================
-- 1. Task Description
-- Parse the email address stored in the `email` column of the
-- customer table into two meaningful components:
--   • `username` → the part before the '@'
--   • `domain`   → the part after the '@'
--
-- Parsing email addresses is useful for profiling customers,
-- analyzing domain usage (e.g., Gmail vs. Yahoo), and performing
-- validation or segmentation. This exercise practices combining
-- POSITION(), LEFT(), and SUBSTRING() for string manipulation.
--
-- 2. Topics Covered
-- - POSITION() to locate a character inside a string
-- - LEFT() to extract all characters before a position
-- - SUBSTRING() to extract characters after a position
-- - Basic text parsing techniques in PostgreSQL
-- ============================================

SELECT
    -- Extract the characters to the left of the '@'
    LEFT(email, POSITION('@' IN email) - 1) AS username,

    -- Extract the characters to the right of the '@'
    SUBSTRING(
        email
        FROM POSITION('@' IN email) + 1
        FOR LENGTH(email)
    ) AS domain
FROM customer;
