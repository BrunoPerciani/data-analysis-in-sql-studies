-- ============================================
-- 1. Task Description
-- Query PostgreSQL's INFORMATION_SCHEMA to retrieve metadata 
-- about the tables and views in the 'public' schema of the 
-- DVD Rentals database. INFORMATION_SCHEMA provides a 
-- standardized way to inspect database objects such as table 
-- names, schema names, table types, and catalog names.
--
-- 2. Topics Covered
-- - INFORMATION_SCHEMA.TABLES system view
-- - Filtering by table_schema
-- - Retrieving metadata about user-created tables and views
-- ============================================

-- Select all columns from the TABLES system database
SELECT *
FROM INFORMATION_SCHEMA.TABLES
-- Filter to only tables and views in the 'public' schema
WHERE table_schema = 'public';
