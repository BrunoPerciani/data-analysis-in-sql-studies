-- ============================================
-- 1. Task Description
-- Concatenate the customer's first name, last name, and email
-- into a formatted string that can be used in an email "To" field.
-- The format should look like:
--     Firstname Lastname <email@example.com>
-- This involves using PostgreSQL string functions to construct
-- readable and properly formatted output.
--
-- 2. Topics Covered
-- - CONCAT() for string concatenation
-- - Literal text inside concatenation
-- - Formatting values for email-like output
-- ============================================

-- Concatenate the first_name and last_name and email
SELECT 
    CONCAT(first_name, ' ', last_name, ' <', email, '>') AS full_email
FROM customer;
