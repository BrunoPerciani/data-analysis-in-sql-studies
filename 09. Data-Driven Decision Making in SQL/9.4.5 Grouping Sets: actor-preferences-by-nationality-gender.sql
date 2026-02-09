-- ============================================
-- 1. Task Description
-- Analyze customer preferences for actors by aggregating
-- engagement and rating metrics across actor attributes.
-- Report average rating, number of ratings, total rentals,
-- and number of distinct actors grouped by:
--   • (nationality, gender)
--   • nationality only
--   • gender only
--   • overall total (grand total)
--
-- Include only movies with at least 4 ratings to ensure
-- robustness, and focus on recent activity from 2018-04-01
-- onward.
--
-- 2. Topics Covered
-- - Many-to-many joins (movies ↔ actsin ↔ actors)
-- - GROUPING SETS for multi-level aggregation
-- - AVG() and COUNT() metrics for preference analysis
-- - Filtering by activity threshold (HAVING on subquery)
-- - Time-window filtering for recent behavior
-- ============================================

SELECT
    a.nationality,
    a.gender,
    AVG(r.rating)                 AS avg_rating,    -- average customer rating
    COUNT(r.rating)               AS n_rating,      -- number of ratings (non-NULL only)
    COUNT(*)                      AS n_rentals,     -- total rentals (rated or not)
    COUNT(DISTINCT a.actor_id)    AS n_actors       -- distinct actors in the group
FROM renting AS r
LEFT JOIN actsin  AS ai ON ai.movie_id  = r.movie_id
LEFT JOIN actors  AS a  ON ai.actor_id  = a.actor_id
WHERE r.movie_id IN (
    SELECT movie_id
    FROM renting
    GROUP BY movie_id
    HAVING COUNT(rating) >= 4        -- ensure sufficient rating activity per movie
)
  AND r.date_renting >= '2018-04-01' -- focus on recent customer behavior
GROUP BY GROUPING SETS (
    (a.nationality, a.gender),       -- country x gender
    (a.nationality),                 -- nationality subtotal
    (a.gender),                      -- gender subtotal
    ()                               -- grand total
)
ORDER BY a.nationality NULLS LAST, a.gender NULLS LAST;
