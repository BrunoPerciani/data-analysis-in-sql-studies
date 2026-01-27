-- ============================================
-- 1. Task Description
-- Practice sorting query results using ORDER BY.
-- Sorting single fields helps extract insights
-- such as longest films, highest-grossing films,
-- or top-rated films. The goal of this exercise
-- is to sort all films by duration from longest
-- to shortest.
--
-- 2. Topics Covered
-- - ORDER BY (sorting output)
-- - DESC (descending order)
-- - Basic SELECT usage
-- ============================================

-- Select the title and duration from longest to shortest film
SELECT title, duration
FROM films
ORDER BY duration DESC;
