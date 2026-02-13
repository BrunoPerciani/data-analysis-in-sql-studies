-- The management team want to target improvements in `Meal` and `Laundry` service in Europe (`EMEA`) and Latin America (`LATAM`). 
-- Write a query to return the `description` of the service, the `id` and `location` of the branch, the id of the request as `request_id` and the `rating` for the services and locations of interest to the management team. 
-- Your output should be a DataFrame named 'target_hotels'.
-- Use the original branch table, not the output of task 1.

SELECT
  s.description,
  r.branch_id,
  b.location,
  r.id AS request_id,
  r.rating
	
FROM request AS r
	
  LEFT JOIN branch AS b
    ON b.id = r.branch_id
  LEFT JOIN service AS s
    ON s.id = r.service_id
	
WHERE upper(btrim(b.location)) IN ('EMEA', 'LATAM')
  AND lower(btrim(s.description)) IN ('meal', 'laundry');
