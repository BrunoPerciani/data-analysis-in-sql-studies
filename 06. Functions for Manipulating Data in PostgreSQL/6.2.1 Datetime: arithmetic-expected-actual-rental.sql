-- ============================================
-- 1. Task Description
-- Join film → inventory → rental to calculate, for each rental:
--   • the actual number of days rented (return_date - rental_date),
--   • the expected return date, based on film.rental_duration.
-- This shows how to add/subtract date-time values and how to convert
-- a numeric duration (in days) into an INTERVAL in PostgreSQL.
--
-- 2. Topics Covered
-- - INNER JOINs across related tables (film, inventory, rental)
-- - Date/time arithmetic: subtraction returns an INTERVAL
-- - Building an INTERVAL from an integer: (rental_duration || ' days')::interval
-- - Deriving expected_return_date = rental_date + INTERVAL
-- ============================================

SELECT
    f.title,
    f.rental_duration,                              -- policy duration (in days)
    r.rental_date,
    r.return_date,
    -- True expected return date = rental_date + rental_duration (as interval)
    r.rental_date + (f.rental_duration || ' days')::interval AS expected_return_date,
    -- Actual time rented as an INTERVAL
    r.return_date - r.rental_date AS days_rented
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
ORDER BY f.title, r.rental_date;
