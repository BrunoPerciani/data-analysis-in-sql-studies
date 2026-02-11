-- ============================================
-- 1. Task Description
-- Retrieve metadata about the `rating` column in the `film` table,
-- which uses the user‑defined ENUM data type `mpaa_rating`. 
-- INFORMATION_SCHEMA.COLUMNS allows us to inspect a column’s
-- logical data type (`data_type`) as well as its underlying 
-- PostgreSQL-specific type (`udt_name`). 
--
-- This is particularly useful when working with ENUM types, as the
-- logical data type will appear as 'USER-DEFINED' and the actual
-- enum name appears under `udt_name`.
--
-- 2. Topics Covered
-- - INFORMATION_SCHEMA.COLUMNS for metadata inspection
-- - data_type vs. udt_name for identifying ENUM types
-- - Filtering by table and column
-- ============================================

-- Select the column name, data type and udt name columns
SELECT 
    column_name, 
    data_type, 
    udt_name
FROM INFORMATION_SCHEMA.COLUMNS
-- Filter by the rating column in the film table
WHERE table_name = 'film'
  AND column_name = 'rating';
