-- ============================================
-- 1. Task Description
-- Explore the structure of the `customer` table in the DVD Rental
-- database by querying INFORMATION_SCHEMA.COLUMNS. This system view
-- allows you to inspect metadata such as column names, data types,
-- maximum character lengths, numeric precision, and nullability.
-- For this step, retrieve only the column names and their data types.
--
-- 2. Topics Covered
-- - INFORMATION_SCHEMA.COLUMNS system view
-- - Filtering by table_name
-- - Inspecting metadata about table structure
-- ============================================

-- Get the column name and data type
SELECT
    column_name,
    data_type
FROM INFORMATION_SCHEMA.COLUMNS
-- For the customer table
WHERE table_name = 'customer'
ORDER BY column_name ASC;
