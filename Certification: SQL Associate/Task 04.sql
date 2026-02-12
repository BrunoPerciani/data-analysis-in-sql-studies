-- So that you can take a more detailed look at the lowest performing hotels, you want to get service and branch information where the average rating for the branch and service combination is lower than 4.5 - the target set by management.  
-- Your output should be a DataFrame named 'average_rating'
-- It should return the `service_id` and `branch_id`, and the average rating (`avg_rating`)
-- Values should be rounded to 2 decimal places where appropriate.

SELECT
  service_id,
  branch_id,
  ROUND(AVG(rating)::numeric, 2) AS avg_rating
	
FROM request AS r
	
GROUP BY
  service_id,
  branch_id
	
HAVING
  AVG(rating) < 4.5;
