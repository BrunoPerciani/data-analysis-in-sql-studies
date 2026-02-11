-- ============================================
-- 1. Task Description
-- Convert the film description column into a tsvector value.
-- The tsvector data type is used by PostgreSQL to support full‑text
-- search functionality. A tsvector contains lexemes (normalized words)
-- extracted from a text field, enabling fast searching and ranking.
--
-- 2. Topics Covered
-- - to_tsvector() for generating searchable lexeme vectors
-- - Text preprocessing for full‑text search in PostgreSQL
-- ============================================

-- Select the film description as a tsvector
SELECT to_tsvector(description)
FROM film;
