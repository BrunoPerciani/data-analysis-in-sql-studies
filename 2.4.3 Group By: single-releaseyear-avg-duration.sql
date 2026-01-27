-- ============================================
-- 1. Task Description
-- Practice using the GROUP BY clause to group
-- records by a single field and summarize each
-- group using aggregate functions. Grouping data
-- allows you to analyze trends and compare values
-- across categories or time periods. The goal of
-- this exercise is to compute the average film
-- duration for each release year.
--
-- 2. Topics Covered
-- - GROUP BY (grouping rows)
-- - AVG() (aggregate function)
-- - Summarizing data by category
-- - Basic SELECT usage
-- ============================================

-- Find the release_year and average duration of films for each year
SELECT release_year, AVG(duration) AS avg_duration
FROM films
GROUP BY release_year;
``
