-- ============================================
-- 1. Task Description
-- Use PostgreSQL's array containment operator (@>) to filter rows
-- where the special_features TEXT[] array contains a specific value.
-- Unlike ANY(), which checks each element individually, the @> operator
-- checks whether the array contains *all elements* of another array,
-- making it ideal for testing membership with concise syntax.
--
-- 2. Topics Covered
-- - ARRAY containment operator: @>
-- - Searching arrays for specific values
-- - TEXT[] array literals: ARRAY['value']
-- - Direct filtering without scanning individual indices
-- ============================================

SELECT 
  title, 
  special_features
FROM film
-- Filter where special_features contains 'Deleted Scenes'
WHERE special_features @> ARRAY['Deleted Scenes'];
