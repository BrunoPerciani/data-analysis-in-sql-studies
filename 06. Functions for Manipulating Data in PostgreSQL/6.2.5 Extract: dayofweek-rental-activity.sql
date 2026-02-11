-- ============================================
-- 1. Task Description
-- Use the EXTRACT() function to derive the day of week (0–6)
-- from the rental_date column, then aggregate the number of
-- rentals per weekday. This breakdown can support forecasting
-- models by revealing day‑of‑week rental patterns.
--
-- 2. Topics Covered
-- - EXTRACT(dow FROM timestamp) to obtain weekday numbers
-- - GROUP BY derived expressions
-- - COUNT() aggregation
-- ============================================

-- Extract day of week from rental_date and count rentals
SELECT 
    EXTRACT(dow FROM rental_date) AS dayofweek,
    COUNT(*) AS rentals
FROM rental
GROUP BY 1
ORDER BY dayofweek;
