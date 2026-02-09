-- ============================================
-- 1. Task Description
-- Practice sorting result sets using ORDER BY
-- on multiple fields. When multiple columns are
-- specified, SQL sorts by the first field, and
-- if there are ties, it continues sorting by
-- the subsequent fields. The goal of this
-- exercise is to sort films by certification
-- first, then by release year.
--
-- 2. Topics Covered
-- - ORDER BY (sorting results)
-- - Sorting multiple fields
-- - Default ascending order
-- - Basic SELECT usage
-- ============================================

-- Select the certification, release year, and title sorted by certification and release year
SELECT certification, release_year, title
FROM films
ORDER BY certification, release_year;
