-- ============================================
-- 1. Task Description
-- Practice creating a view to store and reuse
-- the logic of an existing SQL query.
-- A view acts as a virtual table, allowing users
-- to reference the stored query as if it were a table.
-- The goal of this exercise is to save a query that
-- returns unique authors with an alias into a view.
--
-- 2. Topics Covered
-- - DISTINCT (unique selection)
-- - AS (aliasing a column)
-- - CREATE VIEW (building a virtual table)
-- - Reusing query logic through views
-- ============================================

-- Save the results of this query as a view called library_authors
CREATE VIEW library_authors AS
SELECT DISTINCT author AS unique_author
FROM books;
