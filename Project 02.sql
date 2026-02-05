-- ============================================
-- 1. Task Description
-- Find out how much Wholesale net revenue each product_line generated
-- per month and per warehouse. Only include "Wholesale" orders.
-- Save the query as a view named revenue_by_product_line.
--
-- Required output columns:
-- - product_line
-- - month: displayed as 'June', 'July', 'August'
-- - warehouse
-- - net_revenue: SUM(total) - SUM(payment_fee)
--
-- Sorting:
-- - by product_line
-- - by month (June, then July, then August)
-- - by net_revenue in descending order
--
-- 2. Topics Covered
-- - CTEs (WITH) to filter by client type
-- - CASE expression for month labeling
-- - date_part('month', timestamp) for month extraction
-- - Aggregation with SUM()
-- - Creating views (CREATE VIEW AS)
-- - ORDER BY with custom month order
-- ============================================

-- Create a view that returns wholesale net revenue by product line,
-- for June/July/August, per warehouse.
CREATE OR REPLACE VIEW revenue_by_product_line AS
WITH wholesale AS (
  SELECT *
  FROM sales
  WHERE client_type = 'Wholesale'
)
SELECT
  product_line,
  CASE
    WHEN date_part('month', date) = 6 THEN 'June'
    WHEN date_part('month', date) = 7 THEN 'July'
    WHEN date_part('month', date) = 8 THEN 'August'
  END AS month,
  warehouse,
  -- Requirement: net_revenue = SUM(total) - SUM(payment_fee)
  (SUM(total) - SUM(payment_fee)) AS net_revenue
FROM wholesale
-- Only include June, July, August rows (avoid "Other")
WHERE date_part('month', date) IN (6, 7, 8)
GROUP BY
  product_line,
  CASE
    WHEN date_part('month', date) = 6 THEN 'June'
    WHEN date_part('month', date) = 7 THEN 'July'
    WHEN date_part('month', date) = 8 THEN 'August'
  END,
  warehouse
-- Ensure the requested ordering when selecting from the view
ORDER BY
  product_line,
  CASE
    WHEN date_part('month', date) = 6 THEN 1
    WHEN date_part('month', date) = 7 THEN 2
    WHEN date_part('month', date) = 8 THEN 3
  END,
  net_revenue DESC;
