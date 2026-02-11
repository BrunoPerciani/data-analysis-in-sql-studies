-- ============================================
-- 1. Task Description
-- Practice working with the current date and time in PostgreSQL.
-- Use CURRENT_TIMESTAMP (instead of NOW()) and manipulate it by
-- adding INTERVAL values. Also demonstrate PostgreSQL-style type
-- casting (::timestamp) when converting the current timestamp.
--
-- 2. Topics Covered
-- - CURRENT_TIMESTAMP for retrieving the current date/time
-- - PostgreSQL casting using ::timestamp
-- - Adding INTERVAL values to timestamps
-- - Basic date/time arithmetic
-- ============================================

SELECT
    -- Current timestamp truncated to 0 fractional seconds
    CURRENT_TIMESTAMP(0)::timestamp AS right_now,
    -- Add a 5‑day interval to the current timestamp
    INTERVAL '5 days' + CURRENT_TIMESTAMP(0) AS five_days_from_now;
