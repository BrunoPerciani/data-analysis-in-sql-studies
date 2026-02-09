-- ============================================
-- 1. Task Description
-- Investigate the average customer rating aggregated by
-- country and gender. Produce a report that includes:
--   • country + gender level,
--   • country-only subtotal,
--   • gender-only subtotal,
--   • and the overall grand total.
-- Use GROUPING SETS to return all these aggregation levels
-- in a single query.
--
-- 2. Topics Covered
-- - LEFT JOIN to combine fact (renting) with dimension (customers)
-- - AVG() aggregation
-- - GROUPING SETS for custom multi-level aggregates
-- - Pivot-style reporting (country, gender, totals)
-- ============================================

-- Average rating by country and gender with subtotals and grand total
SELECT
    c.country,
    c.gender,
    AVG(r.rating) AS avg_rating
FROM renting AS r
LEFT JOIN customers AS c
  ON r.customer_id = c.customer_id
-- Report all info from a Pivot table for country and gender
GROUP BY GROUPINGSETS ((c.country, c.gender), (c.country), (c.gender), ())
ORDER BY c.country NULLS LAST, c.gender NULLS LAST;
