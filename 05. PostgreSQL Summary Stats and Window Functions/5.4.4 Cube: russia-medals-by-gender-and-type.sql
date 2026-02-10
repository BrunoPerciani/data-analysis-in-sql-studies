-- ============================================
-- 1. Task Description
-- Break down all medals awarded to Russia during the 2012 Summer
-- Olympics by gender and medal type (Gold, Silver, Bronze). Use
-- GROUP BY CUBE() to generate:
--   • (Gender, Medal) detail rows
--   • Gender-level subtotals
--   • Medal‑level subtotals
--   • Grand total (all medals)
--
-- Since all rows belong to one country (RUS), CUBE(Gender, Medal)
-- produces all meaningful roll-ups and the grand total.
--
-- 2. Topics Covered
-- - GROUP BY CUBE() for all subtotal combinations
-- - Filtering by country and year
-- - Aggregating with COUNT()
-- - Sorting for clear output
-- ============================================

-- Count the medals per gender and medal type with full subtotals
SELECT
  Gender,
  Medal,
  COUNT(*) AS Awards
FROM Summer_Medals
WHERE
  Year = 2012
  AND Country = 'RUS'
-- Get all possible group‑level subtotals plus grand total
GROUP BY CUBE (Gender, Medal)
ORDER BY Gender ASC NULLS LAST,
         Medal  ASC NULLS LAST;
