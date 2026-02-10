-- ============================================
-- 1. Task Description
-- Identify reigning weightlifting champions in the Men's 69KG event.
-- A reigning champion is a country whose athlete won both the current
-- year and the previous year. To determine this, place the current
-- year's champion and the previous year's champion on the same row
-- using LAG(), then compare them.
--
-- 2. Topics Covered
-- - CTE (WITH) to isolate event-specific winners
-- - LAG() window function to fetch the prior row's value
-- - ORDER BY within OVER() to define chronological order
-- - Optional boolean indicator for reigning champion status
-- ============================================

-- Build the list of champions by year for Men's 69KG Weightlifting
WITH Weightlifting_Gold AS (
  SELECT
    Year,
    Country AS champion
  FROM Summer_Medals
  WHERE
    Discipline = 'Weightlifting'
    AND Event = '69KG'
    AND Gender = 'Men'
    AND Medal = 'Gold'
)
-- Return each year with the previous year's champion and a reigning flag
SELECT
  Year,
  Champion,
  -- Fetch the previous year's champion (chronological order)
  LAG(Champion) OVER (ORDER BY Year ASC) AS Last_Champion,
  -- Optional: flag if current champion is the same as last year's
  CASE
    WHEN Champion = LAG(Champion) OVER (ORDER BY Year ASC) THEN TRUE
    ELSE FALSE
  END AS is_reigning
FROM Weightlifting_Gold
ORDER BY Year ASC;
