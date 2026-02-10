-- ============================================
-- 1. Task Description
-- Use the FIRST_VALUE() window function to fetch the first athlete
-- (alphabetically) among all male gold medalists. FIRST_VALUE retrieves
-- a value from an absolute position in the window frame, allowing all
-- rows to be compared against the very first row in sorted order.
--
-- 2. Topics Covered
-- - CTE (WITH) to gather a distinct list of qualifying athletes
-- - DISTINCT to avoid duplicates
-- - FIRST_VALUE() as an absolute-fetch window function
-- - ORDER BY inside OVER() to define the ordering basis
-- ============================================

WITH All_Male_Medalists AS (
  SELECT DISTINCT
    Athlete
  FROM Summer_Medals
  WHERE Medal = 'Gold'
    AND Gender = 'Men'
)
SELECT
  -- Fetch all athletes and the first athlete alphabetically
  Athlete,
  FIRST_VALUE(Athlete) OVER (
      ORDER BY Athlete ASC
  ) AS First_Athlete
FROM All_Male_Medalists
ORDER BY Athlete ASC;
