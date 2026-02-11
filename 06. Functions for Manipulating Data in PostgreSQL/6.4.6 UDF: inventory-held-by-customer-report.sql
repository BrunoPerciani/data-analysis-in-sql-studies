-- ============================================
-- 1. Task Description
-- Use the Sakila database’s user-defined function 
-- `inventory_held_by_customer(inventory_id)` to produce a
-- report showing which film inventory items are currently 
-- held by customers. This function returns the customer_id
-- who is currently holding the item, or NULL if the inventory
-- is not checked out.
--
-- The task: list film titles, their inventory IDs, and the 
-- customer holding each item (if any), filtering to only those 
-- items that are currently held by a customer.
--
-- 2. Topics Covered
-- - Using user-defined functions in SELECT and WHERE clauses
-- - INNER JOIN between film and inventory to associate physical copies
-- - Filtering rows based on UDF output
-- ============================================

SELECT 
    -- Film title
    f.title,
    -- Inventory item identifier
    i.inventory_id,
    -- Determine whether the inventory item is currently held by a customer
    inventory_held_by_customer(i.inventory_id) AS held_by_cust
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
WHERE
    -- Only include results where inventory_held_by_customer() returns a customer_id
    inventory_held_by_customer(i.inventory_id) IS NOT NULL;
