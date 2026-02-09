-- ============================================
-- 1. Task Description
-- Build a CASE expression that compares two numeric columns
-- (home goals vs. away goals) to determine the match outcome
-- for Barcelona when they played as the away team. Return the
-- match date, the opponent (home team), and a human‑readable
-- outcome label.
--
-- 2. Topics Covered
-- - CASE expression comparing two columns
-- - LEFT JOIN to fetch opponent team names
-- - Filtering by team ID to focus on Barcelona as away team
-- - Basic SELECT/WHERE/ORDER BY pattern
-- ============================================

-- Select matches where Barcelona was the away team
SELECT
    m.date,
    t.team_long_name AS opponent,
    CASE
        WHEN m.home_goal < m.away_goal THEN 'Barcelona win!'
        WHEN m.home_goal > m.away_goal THEN 'Barcelona loss :('
        ELSE 'Tie'
    END AS outcome
FROM matches_spain AS m
LEFT JOIN teams_spain AS t
  ON m.hometeam_id = t.team_api_id
-- Filter for Barcelona as the away side (team_id 8634)
WHERE m.awayteam_id = 8634
ORDER BY m.date;
