-- ============================================
-- 1. Task Description
-- Extract only the street name from the address column in the
-- Sakila (DVD Rental) database. The address column stores the
-- street number followed by a space, then the street name.
-- The goal is to remove the numeric street number and return
-- just the street name for all addresses.
--
-- 2. Topics Covered
-- - SUBSTRING() for extracting partial text
-- - POSITION() to locate the first space in the address
-- - LENGTH() for calculating extraction length
-- - Basic string manipulation in PostgreSQL
-- ============================================

SELECT 
    -- Extract the substring starting after the first space
    SUBSTRING(
        address
        FROM POSITION(' ' IN address) + 1
        FOR LENGTH(address)
    ) AS street_name
FROM address;
