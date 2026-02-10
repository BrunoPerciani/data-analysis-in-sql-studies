-- ============================================
-- 1. Task Description
-- Compute a 3-game moving total of medals for each country.
-- Use a window frame to sum the current row and the previous
-- two rows (chronologically by Year), while keeping countries
-- independent via PARTITION BY. This prevents one country’s
-- values from affecting another’s moving totals.
--
-- 2. Topics Covered
-- - CTE (WITH) to aggregate medals per (Year, Country)
-- - SUM() OVER (PARTITION BY ... ORDER BY ...) for running windows
-- - Window frame: ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
-- - Partitioning by Country to isolate groups
-- - Chronological ordering for time-series consistency
-- ============================================

WITH Country_Medals AS (
  SELECT
    Year,
    Country,
    COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Year, Country
)
SELECT
  Year,
  Country,
  Medals,
  -- Calculate each country's 3-game moving total (current + previous 2 years)
  SUM(Medals) OVER (
    PARTITION BY Country
    ORDER BY Year ASC
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS Medals_MA
FROM Country_Medals
ORDER BY Country ASC, Year ASC;

-- Notes:
-- - The 3-row frame here is row-based, not gap-based; it sums the current
--   year and the two immediately prior rows WITHIN each country’s partition.
-- - If some Olympic years are missing for a country, this still counts up to
--   three rows but may skip calendar years. To enforce contiguous annual
--   windows, generate a full year series per country and LEFT JOIN, then
--   COALESCE(Medals, 0) before applying the window.
