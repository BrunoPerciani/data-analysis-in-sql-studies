-- ============================================
-- 1. Task Description
-- Perform a basic full‑text search on the film title using PostgreSQL’s
-- full‑text search engine. Convert the title to a tsvector and match it
-- against a tsquery ('elf'). This returns films whose title contains the
-- lexeme “elf,” similar to using LIKE '%elf%' but more efficient and
-- compatible with advanced search features.
--
-- 2. Topics Covered
-- - to_tsvector() to tokenize text into lexemes
-- - to_tsquery() to create a searchable full‑text query
-- - @@ match operator to compare tsvector to tsquery
-- - Eliminating the need for wildcard LIKE searches
-- ============================================

-- Select the title and description
SELECT 
    title, 
    description
FROM film
-- Convert the title to a tsvector and match it against the tsquery
WHERE to_tsvector(title) @@ to_tsquery('elf');
