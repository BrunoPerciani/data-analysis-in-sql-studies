-- ============================================
-- 1. Task Description
-- Recreate the full email string for each customer using padding
-- functions instead of basic concatenation. The goal is to format
-- the output similar to:
--     Firstname Lastname <email@example.com>
--
-- Using RPAD (right‑padding), you will insert the needed spaces
-- and angle‑bracket characters by dynamically computing the length
-- of each component string.
--
-- 2. Topics Covered
-- - RPAD() padding function
-- - Combining multiple padding and concatenation operations
-- - LENGTH() to compute required string lengths
-- - Building formatted output using padded segments
-- ============================================

-- Concatenate first_name, last_name, and email using padding functions
SELECT
    -- Pad first_name with 1 extra space to separate it from last_name
    RPAD(first_name, LENGTH(first_name) + 1, ' ')
    ||
    -- Pad last_name and append ' <' as prefix to the email
    RPAD(last_name, LENGTH(last_name) + 2, ' <')
    ||
    -- Pad email and append '>' to close the formatted email
    RPAD(email, LENGTH(email) + 1, '>') AS full_email
FROM customer;
