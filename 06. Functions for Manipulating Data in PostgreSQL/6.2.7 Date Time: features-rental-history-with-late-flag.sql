-- ============================================
-- 1. Task Description
-- Build a 90-day rental history dataset combining customer, film,
-- inventory, and rental data. Use date/time functions to:
--   • extract the weekday of rental (EXTRACT(dow)),
--   • compute the rental interval (AGE(return_date, rental_date)),
--   • and flag whether the rental was returned past due by comparing
--     the elapsed rental duration to the policy duration on the film.
--
-- This dataset can support modeling of renter behavior by weekday and
-- the likelihood of late returns.
--
-- 2. Topics Covered
-- - Multi-table joins: film → inventory → rental → customer
-- - EXTRACT(dow FROM timestamp) to get weekday (0 = Sunday … 6 = Saturday)
-- - AGE(end, start) to compute elapsed interval
-- - DATE_TRUNC('day', interval) to normalize intervals to whole days
-- - INTERVAL arithmetic (e.g., f.rental_duration * INTERVAL '1 day')
-- - Bounded date filtering with a 90-day window
-- ============================================

SELECT
  -- Customer full name
  c.first_name || ' ' || c.last_name AS customer_name,
  -- Film title
  f.title,
  -- Rental timestamp
  r.rental_date,
  -- Day of week (0=Sun, 1=Mon, …, 6=Sat)
  EXTRACT(dow FROM r.rental_date) AS dayofweek,
  -- Elapsed rental time as an INTERVAL
  AGE(r.return_date, r.rental_date) AS rental_days,
  -- Past-due flag: TRUE if elapsed whole days exceed the allowed duration
  CASE
    WHEN DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) >
         f.rental_duration * INTERVAL '1 day'
    THEN TRUE
    ELSE FALSE
  END AS past_due
FROM film AS f
INNER JOIN inventory AS i
  ON f.film_id = i.film_id
INNER JOIN rental AS r
  ON i.inventory_id = r.inventory_id
INNER JOIN customer AS c
  ON c.customer_id = r.customer_id
WHERE
  -- Use a DATE lower bound and a 90-day INTERVAL upper bound
  r.rental_date BETWEEN DATE '2005-05-01'
                    AND DATE '2005-05-01' + INTERVAL '90 days'
ORDER BY f.title, r.rental_date, customer_name;
