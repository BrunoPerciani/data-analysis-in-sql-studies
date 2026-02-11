-- ============================================
-- 1. Task Description
-- Create a formatted field called film_category by concatenating the
-- category name (uppercased) with the film title, and truncate the
-- film description to ≤ 50 characters **without cutting off a word**.
-- This uses REVERSE() + POSITION() to find the last whitespace at or
-- before the 50-character boundary, then trims at that boundary.
--
-- 2. Topics Covered
-- - String concatenation with || 
-- - Case transformation: UPPER()
-- - Safe truncation at word boundary using LEFT() + REVERSE() + POSITION()
-- - INNER JOIN across film → film_category → category
-- ============================================

SELECT 
  -- Concatenate the uppercase category name and the film title
  UPPER(c.name) || ': ' || f.title AS film_category, 

  -- Truncate the description to <= 50 chars, without cutting the last word
  LEFT(
    f.description,
    50 - POSITION(' ' IN REVERSE(LEFT(f.description, 50)))
  ) AS film_desc
FROM film AS f
INNER JOIN film_category AS fc
  ON f.film_id = fc.film_id
INNER JOIN category AS c
  ON fc.category_id = c.category_id;
