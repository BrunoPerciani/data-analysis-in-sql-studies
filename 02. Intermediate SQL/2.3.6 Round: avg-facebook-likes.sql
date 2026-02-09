-- ============================================
-- 1. Task Description
-- Practice using the ROUND() function to simplify
-- numerical outputs from aggregate functions.
-- Rounding helps produce cleaner, more readable
-- results, especially when dealing with averages
-- or financial figures. The goal of this exercise
-- is to round the average number of Facebook likes
-- to one decimal place.
--
-- 2. Topics Covered
-- - AVG() (computing average values)
-- - ROUND() (controlling decimal precision)
-- - Combining ROUND with aggregate functions
-- - Basic SELECT usage
-- ============================================

-- Round the average number of facebook_likes to one decimal place
SELECT ROUND(AVG(facebook_likes), 1) AS avg_facebook_likes
FROM reviews;
