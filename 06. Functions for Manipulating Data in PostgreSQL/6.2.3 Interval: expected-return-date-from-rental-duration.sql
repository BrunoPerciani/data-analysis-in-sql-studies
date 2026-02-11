-- ============================================
-- 1. Task Description
-- Calculate the expected return date for each DVD rental by adding
-- the rental_duration (expressed in days) to the rental_date. This
-- requires converting rental_duration into an INTERVAL and performing
-- date arithmetic. Join film → inventory → rental because film and
-- rental are not directly related.
--
-- 2. Topics Covered
-- - INTERVAL arithmetic: converting integer days into an INTERVAL
-- - Timestamp addition: rental_date + INTERVAL '1 day' * rental_duration
-- - Multi-table joins (film → inventory → rental)
-- - Selecting columns across joined tables
-- ============================================

SELECT
    f.title,
    r.rental_date,
    f.rental_duration,
    -- Add the rental duration (days) to the rental date
    (INTERVAL '1 day' * f.rental_duration) + r.rental_date AS expected_return_date,
    r.return_date
FROM film AS f
INNER JOIN inventory AS i 
    ON f.film_id = i.film_id
INNER JOIN rental AS r 
    ON i.inventory_id = r.inventory_id
ORDER BY f.title;
