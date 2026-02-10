-- ============================================
-- 1. Task Description
-- Produce a scannable, wide-format table showing the ranking (by count
-- of gold medals) of the three most populous EU countries (FRA, GBR, GER)
-- for Olympic years 2004, 2008, and 2012. Compute medal counts per
-- (Country, Year), rank countries within each year, then pivot the ranks
-- into columns using PostgreSQL’s CROSSTAB.
--
-- Output format:
-- | Country | 2004 | 2008 | 2012 |
-- |---------|------|------|------|
-- | FRA     |  ..  |  ..  |  ..  |
-- | GBR     |  ..  |  ..  |  ..  |
-- | GER     |  ..  |  ..  |  ..  |
--
-- 2. Topics Covered
-- - CREATE EXTENSION tablefunc (enables CROSSTAB)
-- - Aggregation: COUNT(*) per (Country, Year)
-- - Window ranking: RANK() OVER (PARTITION BY Year ORDER BY Awards DESC)
-- - Pivoting long -> wide with CROSSTAB and explicit column typing
-- - Stable ordering for crosstab categories
-- ============================================

-- Enable crosstab support (PostgreSQL)
CREATE EXTENSION IF NOT EXISTS tablefunc;

-- Pivot ranking of FRA/GBR/GER by gold medals in 2004, 2008, 2012
SELECT *
FROM CROSSTAB($$
  WITH Country_Awards AS (
    SELECT
      Country,
      Year,
      COUNT(*) AS Awards
    FROM Summer_Medals
    WHERE
      Country IN ('FRA', 'GBR', 'GER')
      AND Year IN (2004, 2008, 2012)
      AND Medal = 'Gold'
    GROUP BY Country, Year
  )
  SELECT
    Country,
    Year,
    RANK() OVER (
      PARTITION BY Year
      ORDER BY Awards DESC
    )::INTEGER AS rank
  FROM Country_Awards
  -- Important: CROSSTAB expects a stable ordering by row category and
  -- then by the category to pivot (Year). This ensures correct column placement.
  ORDER BY Country ASC, Year ASC;
$$)
-- Define the output columns for the pivoted table
AS ct (
  Country VARCHAR,
  "2004"  INTEGER,
  "2008"  INTEGER,
  "2012"  INTEGER
)
ORDER BY Country ASC;
