-- ============================================
-- 1. Task Description
-- Work with PostgreSQL ARRAY data types by accessing elements
-- within the special_features column of the film table. This
-- column is of type TEXT[] and stores multiple features (e.g.,
-- 'Trailers', 'Commentaries', 'Behind the Scenes', etc.).
-- The goal is to return films whose first special feature
-- equals 'Trailers'.
--
-- 2. Topics Covered
-- - ARRAY data types in PostgreSQL
-- - 1‑based indexing for ARRAY access (special_features[1])
-- - Filtering results based on ARRAY element values
-- ============================================

-- Select the title and special features column 
SELECT 
  title, 
  special_features
FROM film
-- Use the array index of the special_features column
WHERE special_features[1] = 'Trailers';
