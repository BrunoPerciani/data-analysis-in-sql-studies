-- ============================================
-- 1. Task Description
-- Convert the rental_duration column (stored as an integer number
-- of days) into a proper INTERVAL value using INTERVAL arithmetic.
-- Then calculate the actual time rented for each film (return_date
-- - rental_date), while excluding outstanding rentals (those with
-- a NULL return_date). This simulates real-world DVD rental logic
-- where you must determine expected vs. actual rental durations.
--
-- 2. Topics Covered
-- - INTERVAL arithmetic: multiplying an INTERVAL by a numeric value
-- - Date subtraction: return_date - rental_date returns an INTERVAL
-- - INNER JOIN across film → inventory → rental tables
-- - Filtering out outstanding rentals with return_date IS NOT NULL
-- ============================================

SELECT
    f.title,
    -- Convert the rental_duration (integer days) into an INTERVAL
    INTERVAL '1 day' * f.rental_duration AS rental_duration_interval,
    -- Calculate the actual days rented as an interval
    r.return_date - r.rental_date AS days_rented
FROM film AS f
INNER JOIN inventory AS i 
    ON f.film_id = i.film_id
INNER JOIN rental AS r 
    ON i.inventory_id = r.inventory_id
-- Exclude rentals that have not yet been returned
WHERE r.return_date IS NOT NULL
ORDER BY f.title;
