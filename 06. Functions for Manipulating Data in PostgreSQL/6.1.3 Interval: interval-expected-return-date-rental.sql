-- ============================================
-- 1. Task Description
-- Demonstrate how to use the INTERVAL data type to perform arithmetic
-- with date/time values in PostgreSQL. Specifically, compute the
-- expected return date for a DVD rental by adding a 3‑day INTERVAL
-- to the rental_date. This can be used to determine whether a DVD
-- was returned late by comparing expected_return_date to return_date.
--
-- 2. Topics Covered
-- - INTERVAL data type and date arithmetic
-- - Adding intervals to TIMESTAMP fields
-- - Basic SELECT with computed columns
-- ============================================

SELECT
    -- Select the rental and return dates
    rental_date,
    return_date,
    -- Calculate the expected return date
    rental_date + INTERVAL '3 days' AS expected_return_date
FROM rental;
