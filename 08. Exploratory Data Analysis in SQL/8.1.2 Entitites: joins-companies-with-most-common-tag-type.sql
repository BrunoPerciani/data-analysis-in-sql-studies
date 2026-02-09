-- ============================================
-- 1. Task Description
-- Read and leverage an entity relationship diagram (ERD)
-- to join multiple tables and answer a business question:
-- What is the most common tag_type on Stack Overflow, and
-- which companies have a tag of that type? This step builds
-- the final result set by joining company → tag_company → tag_type
-- and filtering to the most common type (here, 'cloud').
--
-- 2. Topics Covered
-- - INNER JOIN (joining related tables)
-- - Reading ERDs to determine join keys and directions
-- - Many-to-many relationships via bridge tables (tag_company)
-- - Filtering joined results (WHERE)
-- - Selecting and qualifying columns from multiple tables
-- ============================================

-- Select the company name and the tag + type for the most common tag_type
SELECT
  company.name,
  tag_type.tag,
  tag_type.type
FROM company
  -- Join companies to their tags via the bridge table
  INNER JOIN tag_company
    ON company.id = tag_company.company_id
  -- Join tags to their type metadata
  INNER JOIN tag_type
    ON tag_company.tag = tag_type.tag
-- Filter to the most common type (as identified beforehand)
WHERE tag_type.type = 'cloud';
