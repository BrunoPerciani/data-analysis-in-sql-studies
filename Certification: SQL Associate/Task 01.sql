-- Before you can start any analysis, you need to confirm that the data is accurate and reflects what you expect to see. 
-- It is known that there are some issues with the `branch` table, and the data team have provided the following data description. 
-- Write a query to return data matching this description, including identifying and cleaning all invalid values. 
-- You must match all column names and description criteria. Your output should be a DataFrame named 'clean_branch_data'.

-- | Column Name | Criteria                                                |
-- |-------------|---------------------------------------------------------|
-- |id | Nominal. The unique identifier of the hotel. Missing values are not possible due to the database structure.|
-- | location | Nominal. The location of the particular hotel. One of four possible values, 'EMEA', 'NA', 'LATAM' and 'APAC'. Missing values should be replaced with “Unknown”. |
-- | total_rooms | Discrete. The total number of rooms in the hotel. Must be a positive integer between 1 and 400. Missing values should be replaced with the default number of rooms, 100. |
-- | staff_count | Discrete. The number of staff employeed in the hotel service department. Missing values should be replaced with the total_rooms multiplied by 1.5. |
-- | opening_date | Discrete. The year in which the hotel opened. This can be any value between 2000 and 2023. Missing values should be replaced with 2023. |
-- | target_guests | Nominal. The primary type of guest that is expected to use the hotel. Can be one of 'Leisure' or 'Business'. Missing values should be replaced with 'Leisure'. |

WITH normalized AS (
  SELECT
    b.id,
    regexp_replace(
      upper(coalesce(b.location, '')), 
      '[^[:alpha:]]', 
      '', 
      'g'
    ) AS location_norm,
    b.total_rooms,
    b.staff_count AS staff_count_raw,
    b.opening_date,
    regexp_replace(
      lower(coalesce(b.target_guests, '')), 
      '[^[:alpha:]]', 
      '', 
      'g'
    ) AS guests_norm
  FROM branch b
),

cleaned AS (
  SELECT
    id,
    
    CASE
      WHEN location_norm = '' 
        THEN 'Unknown'
      WHEN location_norm IN ('EMEA', 'NA', 'LATAM', 'APAC') 
        THEN location_norm
      WHEN location_norm LIKE '%EUROPE%' 
           OR location_norm LIKE '%AFRICA%' 
           OR location_norm LIKE '%MIDDLEEAST%' 
        THEN 'EMEA'
      WHEN location_norm LIKE '%NORTHAMERICA%' 
           OR location_norm LIKE '%UNITEDSTATES%' 
           OR location_norm LIKE '%CANADA%' 
        THEN 'NA'
      WHEN location_norm LIKE '%LATINAMERICA%' 
           OR location_norm LIKE '%SOUTHAMERICA%' 
           OR location_norm LIKE '%BRAZIL%' 
        THEN 'LATAM'
      WHEN location_norm LIKE '%ASIA%' 
           OR location_norm LIKE '%PACIFIC%' 
        THEN 'APAC'
      ELSE 'Unknown'
    END AS location,
    
    CASE
      WHEN total_rooms IS NULL 
        THEN 100
      WHEN total_rooms::text ~ '^\s*\d+\s*$'
           AND total_rooms::int BETWEEN 1 AND 400
        THEN total_rooms::int
      ELSE 100
    END AS total_rooms,
    
    staff_count_raw,
    
    CASE
      WHEN opening_date IS NULL 
        THEN 2023
      WHEN opening_date::text ~ '^\s*\d+\s*$'
           AND opening_date::int BETWEEN 2000 AND 2023
        THEN opening_date::int
      ELSE 2023
    END AS opening_date,
    
    CASE
      WHEN guests_norm = '' 
        THEN 'Leisure'
      WHEN guests_norm IN ('leisure', 'leasure')
        THEN 'Leisure'
      WHEN guests_norm = 'business' 
        THEN 'Business'
      ELSE 'Leisure'
    END AS target_guests
    
  FROM normalized
)

SELECT
  id,
  location,
  total_rooms,
  
  CASE
    WHEN staff_count_raw IS NULL 
      THEN round(total_rooms * 1.5)::int
    WHEN staff_count_raw::text ~ '^\s*\d+\s*$' 
         AND staff_count_raw::int > 0 
      THEN staff_count_raw::int
    ELSE round(total_rooms * 1.5)::int
  END AS staff_count,
  
  opening_date,
  target_guests
  
FROM cleaned;

-------------------------------------------------------------------------------

SELECT 
    id,
    COALESCE(location, 'Unknown') AS location,
    COALESCE(total_rooms, 100) AS total_rooms,
    COALESCE(staff_count, 1.5 * total_rooms) AS staff_count,
  
    CASE 
        WHEN opening_date = '-' THEN '2023'
        ELSE COALESCE(opening_date, '2023')
    END AS opening_date,
  
    CASE 
        WHEN target_guests ILIKE 'B%' THEN 'Business'
        ELSE 'Leisure'
    END AS target_guests
  
FROM branch;
