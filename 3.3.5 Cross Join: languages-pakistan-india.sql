-- ============================================
-- 1. Task Description
-- Explore the possible historical overlap of languages
-- spoken in Pakistan and India by using a CROSS JOIN
-- to generate all combinations between the two sets
-- of languages. This helps answer the question:
-- “What languages could potentially have been spoken
-- in either country across their shared history?”
--
-- 2. Topics Covered
-- - CROSS JOIN for all possible pairings
-- - Filtering both sides of the join independently
-- - Understanding how CROSS JOIN differs from INNER JOIN
-- - Basic country/language lookup using IN filters
-- ============================================

-- Produce all possible pairings between Pakistan/India
-- and the languages spoken in those same countries
SELECT 
    c.name AS country,
    l.name AS language
FROM countries AS c
-- Perform a CROSS JOIN to languages (alias l)
CROSS JOIN languages AS l
WHERE c.code IN ('PAK', 'IND')
  AND l.code IN ('PAK', 'IND');
