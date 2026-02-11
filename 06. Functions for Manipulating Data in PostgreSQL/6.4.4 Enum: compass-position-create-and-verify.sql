-- ============================================
-- 1. Task Description
-- Create a user-defined ENUM data type called `compass_position`
-- representing the four cardinal directions (North, South, East, West).
-- Then confirm that the new ENUM type was successfully registered in
-- PostgreSQL by querying the pg_type system catalog.
--
-- ENUM types are useful when you need a fixed set of allowed values
-- that rarely change, ensuring consistency and preventing invalid data.
--
-- 2. Topics Covered
-- - CREATE TYPE ... AS ENUM
-- - User-defined data types
-- - Querying pg_type to verify type creation
-- ============================================

-- Create an enumerated data type, compass_position
CREATE TYPE compass_position AS ENUM (
    -- Use the four cardinal directions
    'North',
    'South',
    'East',
    'West'
);

-- Confirm the new data type is in the pg_type system table
SELECT *
FROM pg_type
WHERE typname = 'compass_position';
