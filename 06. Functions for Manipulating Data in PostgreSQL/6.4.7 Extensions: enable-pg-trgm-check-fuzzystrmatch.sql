-- ============================================
-- 1. Task Description
-- Enable the `pg_trgm` extension so that PostgreSQL can use fuzzy
-- trigram‑based text matching functions. Then verify that both
-- `pg_trgm` and `fuzzystrmatch` are enabled by querying the
-- pg_extension system catalog.
--
-- Extensions must be enabled before their functions or operators
-- can be used. PostgreSQL often ships with many powerful
-- extensions pre‑installed but not activated.
--
-- 2. Topics Covered
-- - CREATE EXTENSION to enable PostgreSQL extensions
-- - Checking installed/enabled extensions using pg_extension
-- - Preparing database for fuzzy search functions (pg_trgm,
--   fuzzystrmatch)
-- ============================================

-- Enable the trigram text‑search extension
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Confirm all enabled extensions, including fuzzystrmatch
SELECT *
FROM pg_extension;
