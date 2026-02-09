-- ============================================
-- 1. Task Description
-- Practice combining aggregate functions with the
-- WHERE clause to summarize specific subsets of
-- data. This technique is useful for analyzing
-- financial performance, trends by categories,
-- or patterns within filtered groups. The goal of
-- this exercise is to calculate the average gross
-- of films whose titles begin with the letter 'A'.
--
-- 2. Topics Covered
-- - AVG() (computing average values)
-- - WHERE (filtering subsets of data)
-- - LIKE (pattern matching)
-- - Combining filters with aggregate functions
-- ============================================

-- Calculate the average gross of films that start with A
SELECT AVG(gross) AS avg_gross_A
FROM films
WHERE title LIKE 'A%';
