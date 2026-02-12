-- The Head of Operations wants to know whether there is a difference in time taken to respond to a customer request in each hotel. They already know that different services take different lengths of time. 

-- Calculate the average and maximum duration for each branch and service. 
-- Your output should be a DataFrame named 'average_time_service'
-- It should include the columns `service_id`, `branch_id`, `avg_time_taken` and `max_time_taken`
-- Values should be rounded to two decimal places where appropriate.

SELECT
  service_id,
  branch_id,
  ROUND(AVG(time_taken), 2) AS avg_time_taken,
  ROUND(MAX(time_taken), 2) AS max_time_taken
	
FROM public.request
	
GROUP BY
  service_id,
  branch_id;
