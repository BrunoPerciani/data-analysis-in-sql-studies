-- ============================================
-- 1. Task Description
-- Build a dataset that tests whether the phrase "Astounding Drama"
-- in a film's description is associated with higher rental activity.
-- Step 1: use PostgreSQL full-text search to find descriptions that
-- match both words ("Astounding" AND "Drama"). Step 2: compute a
-- trigram similarity score against the phrase to rank the matches
-- by closeness in wording.
--
-- (A next step—outside this snippet—would be to join with rental data
-- to aggregate rentals per month and test correlation vs. the similarity score.)
--
-- 2. Topics Covered
-- - Full-text search:
--     * to_tsvector(text) → produce a searchable lexeme vector
--     * to_tsquery('term1 & term2') → boolean query (AND)
--     * @@ operator → vector-vs-query match
-- - Fuzzy matching:
--     * similarity(text, text) from pg_trgm to rank by phrasing closeness
-- - Ordering results by similarity for relevance
-- ============================================

-- Select matching films and rank descriptions by similarity to the phrase
SELECT 
  title, 
  description, 
  -- Calculate trigram similarity to "Astounding Drama"
  similarity(description, 'Astounding Drama') AS similarity_score
FROM film
WHERE
  -- Full-text search: both terms must be present (AND)
  to_tsvector(description) @@ to_tsquery('Astounding & Drama')
ORDER BY 
  similarity(description, 'Astounding Drama') DESC;
