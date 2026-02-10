-- ============================================
-- 1. Task Description
-- Use the LAST_VALUE() window function to retrieve, for every row,
-- the most recent (last) city in which the Olympic Games were held,
-- based on chronological order by Year. This lets you compare each
-- prior host to the latest known host within the same result set.
--
-- 2. Topics Covered
-- - CTE (WITH) to deduplicate host (Year, City) pairs
-- - LAST_VALUE() as an absolute-fetch window function
-- - Proper window frame for LAST_VALUE:
--     ROWS/RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
--   so the function can see the entire partition (otherwise it may
--   default to the current row only and return the current value).
-- - Chronological ordering by Year
-- ============================================

WITH Hosts AS (
  SELECT DISTINCT
         Year,
         City
  FROM Summer_Medals
)
SELECT
  Year,
  City,
  -- Get the last city in which the Olympic Games were held (across all rows)
  LAST_VALUE(City) OVER (
    ORDER BY Year ASC
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS Last_City
FROM Hosts
ORDER BY Year ASC;
