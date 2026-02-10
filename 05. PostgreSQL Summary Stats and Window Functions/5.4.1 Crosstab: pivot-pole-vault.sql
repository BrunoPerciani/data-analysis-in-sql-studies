-- ============================================
-- 1. Task Description
-- Pivot the Pole Vault gold medalists by Year (2008, 2012)
-- into a wide-format table using PostgreSQL’s CROSSTAB function.
-- The pivot should show one row per Gender, with columns for
-- the champion country in 2008 and 2012.
--
-- 2. Topics Covered
-- - Enabling the tablefunc extension (CREATE EXTENSION tablefunc)
-- - Using CROSSTAB() to pivot long-format data into wide format
-- - Defining output column names and types for the pivoted table
-- - Ordering categories for consistent crosstab output
-- ============================================

-- Create the correct extension to enable CROSSTAB
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
  SELECT
    Gender,
    Year,
    Country
  FROM Summer_Medals
  WHERE
    Year IN (2008, 2012)
    AND Medal = 'Gold'
    AND Event = 'Pole Vault'
  ORDER BY Gender ASC, Year ASC
$$)
-- Fill in the correct column names for the pivoted table
AS ct (
       Gender VARCHAR,
       "2008" VARCHAR,
       "2012" VARCHAR
     )
ORDER BY Gender ASC;
