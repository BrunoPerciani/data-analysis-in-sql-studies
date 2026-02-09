-- ============================================
-- 1. Task Description
-- Use a subquery in the FROM clause to prepare intermediate
-- fields — including total goals per match — and then filter
-- in the outer query for matches with 10 or more total goals.
-- Return the country, date, home goals, and away goals for
-- all such high‑scoring matches across the European Soccer
-- Database.
--
-- 2. Topics Covered
-- - Subqueries in the FROM clause (derived tables)
-- - Aliasing subqueries and selecting from them directly
-- - Precomputing expressions (total_goals) inside a subquery
-- - Using outer WHERE to filter on computed subquery fields
-- ============================================

SELECT
    -- Select country, date, home, and away goals from the subquery
    country,
    date,
    home_goal,
    away_goal
FROM
    -- Subquery computing total goals and mapping countries
    (
        SELECT
            c.name AS country,
            m.date,
            m.home_goal,
            m.away_goal,
            (m.home_goal + m.away_goal) AS total_goals
        FROM match AS m
        LEFT JOIN country AS c
          ON m.country_id = c.id
    ) AS subq
-- Filter by total goals scored in the main query
WHERE total_goals >= 10
ORDER BY date, country;
