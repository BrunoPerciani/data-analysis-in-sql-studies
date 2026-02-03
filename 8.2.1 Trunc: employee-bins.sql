-- ============================================
-- 1. Task Description
-- Practice using the TRUNC() function to bin or
-- bucket numerical values for exploratory analysis.
-- TRUNC() replaces digits with zeros based on the
-- truncation level, enabling grouped distributions.
-- Negative place values truncate digits to the left
-- of the decimal, positive place values truncate to
-- the right. The goal of this exercise is to truncate
-- the employees count for Fortune 500 companies,
-- binning them into groups of 10,000 employees, and
-- count how many companies fall into each bin.
--
-- 2. Topics Covered
-- - TRUNC() (numeric truncation)
-- - GROUP BY using derived expressions
-- - COUNT() (frequency counting)
-- - WHERE (filtering rows)
-- - ORDER BY (sorting grouped results)
-- ============================================

-- Truncate employees into 10,000-employee bins and count companies within each bin
SELECT
    TRUNC(employees, -4) AS employee_bin,  -- bin employees into groups of 10,000
    COUNT(*) AS company_count              -- number of companies in each bin
FROM fortune500
-- Limit to companies with fewer than 100,000 employees
WHERE employees < 100000
-- Group results by the truncated bin
GROUP BY employee_bin
-- Sort results by the binned values
ORDER BY employee_bin;
