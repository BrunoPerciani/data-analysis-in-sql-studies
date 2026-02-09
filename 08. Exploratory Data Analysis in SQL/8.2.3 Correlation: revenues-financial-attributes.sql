-- ============================================
-- 1. Task Description
-- Explore the relationship between a company's
-- revenue and its financial attributes by computing
-- Pearson correlations using the corr() function.
-- The goal is to determine how revenues correlate
-- with profits, assets, and equity, helping identify
-- which financial metrics move together.
--
-- 2. Topics Covered
-- - corr(x, y) (Pearson correlation coefficient)
-- - Interpreting correlation values:
--     * +1  : strong positive relationship
--     *  0  : no linear relationship
--     * -1  : strong negative relationship
-- - Comparing multiple correlations in a single query
-- - Basic SELECT usage
-- ============================================

-- Correlation between revenues and key financial attributes
SELECT
    corr(revenues, profits) AS rev_profits,   -- how revenues relate to profits
    corr(revenues, assets)  AS rev_assets,    -- how revenues relate to assets
    corr(revenues, equity)  AS rev_equity     -- how revenues relate to equity
FROM fortune500;
