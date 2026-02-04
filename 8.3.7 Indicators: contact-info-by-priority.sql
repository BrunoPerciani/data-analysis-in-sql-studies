-- ============================================
-- 1. Task Description
-- Create and store indicator variables (0/1) that detect the presence
-- of an email address and a phone number in evanston311 descriptions.
-- Then, analyze whether medium and high priority requests are more
-- likely to include contact info by computing proportions per priority.
--
-- Detection rules:
-- - Email: description contains an '@' character.
-- - Phone: description matches pattern '___-___-____' (e.g., 555-555-1212).
--
-- 2. Topics Covered
-- - CREATE TEMP TABLE to persist intermediate indicators
-- - LIKE with wildcards: % (any number of chars), _ (single char)
-- - Casting boolean to integer for aggregation (TRUE→1, FALSE→0)
-- - LEFT JOIN to bring indicators onto the main table
-- - Proportion calculation via SUM(indicator)/COUNT(*)
-- - GROUP BY to summarize by priority
-- ============================================

-- To clear table if it already exists
DROP TABLE IF EXISTS indicators;

-- Create the temp table of indicator flags per record
CREATE TEMP TABLE indicators AS
SELECT
    id,
    CAST(description LIKE '%@%' AS integer)              AS email,  -- 1 if '@' present
    CAST(description LIKE '%___-___-____%' AS integer)   AS phone   -- 1 if phone pattern present
FROM evanston311;

-- Compute the proportion of emails/phones per priority
SELECT
    priority,
    -- proportion = sum of 1/0 flags divided by total rows in the group
    SUM(email) / COUNT(*)::numeric AS email_prop,
    SUM(phone) / COUNT(*)::numeric AS phone_prop
FROM evanston311
LEFT JOIN indicators
  ON evanston311.id = indicators.id
GROUP BY priority
ORDER BY priority;  -- optional ordering for readability
