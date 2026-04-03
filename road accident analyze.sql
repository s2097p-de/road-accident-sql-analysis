-- 1. Basic SQL Questions 
-- Find all accidents in a specific city
SELECT *
FROM indian_roads_dataset
WHERE city = 'kolkata';

-- Get all accidents where severity = 'High'
SELECT *
FROM indian_roads_dataset
WHERE accident_severity  = 'fatal';

-- List accidents that happened on weekends
/*SELECT * 
FROM indian_roads_dataset
WHERE day_of_week ='Saturday' or day_of_week = 'Sunday';
*/
SELECT * 
FROM indian_roads_dataset
WHERE is_weekend = 1;

-- Show top 10 accidents with highest risk_score
SELECT *
FROM indian_roads_dataset
WHERE risk_score = 1
ORDER BY risk_score DESC
LIMIT 10;

-- Find accidents where weather = 'Rainy'
SELECT *
FROM indian_roads_dataset
WHERE weather = 'rain';

-- Get accidents where traffic_density = 'High'
SELECT *
FROM indian_roads_dataset
WHERE traffic_density = 'high';

-- 2. Filtering + Conditions
-- Find accidents between two dates
SELECT *
FROM indian_roads_dataset
WHERE date between'2024-09-15' and  '2024-12-15';
 
 -- Get accidents where visibility < 2 km , assume that  due to rain visibility is medium.
 SELECT *
FROM indian_roads_dataset
WHERE visibility ='medium';

-- Find cases where vehicles_involved > 3
 SELECT *
FROM indian_roads_dataset
WHERE vehicles_involved >3;

-- Show accidents during peak hours 
SELECT *
FROM indian_roads_dataset
WHERE is_peak_hour = 1;

-- Find accidents where festival IS NOT NULL
SELECT *
FROM indian_roads_dataset
WHERE festival != 'None';

-- 3. Aggregation 
-- Count total accidents per city
SELECT 
	city,
    count(accident_id) AS Total_count
FROM indian_roads_dataset
WHERE city IN ('Kolkata','Pune','Bangalore','Chandigarh','Chennai','Delhi','Hyderabad','Mumbai')
GROUP BY city
ORDER BY city ASC;

-- Find total casualties per state
SELECT 
	state,
    sum(casualties) AS Total_casualties
FROM indian_roads_dataset
WHERE state IN ('Delhi','Karnataka','Maharashtra','Punjab','Tamil Nadu','Telangana','West Bengal')
GROUP BY state;   

-- Average risk score per road type
SELECT 
	road_type,
    avg(risk_score)
FROM indian_roads_dataset
WHERE road_type IN ('highway','rural','urban')
GROUP BY road_type;

-- Count accidents by weather condition
SELECT 
	weather,
    count(accident_id)
FROM indian_roads_dataset
WHERE weather IN ('clear','fog','rain')
GROUP BY weather;

-- Find max and min temperature during accidents
SELECT 
    accident_id,
    MAX(temperature) AS max_temperature,
    MIN(temperature) AS min_temperature
FROM indian_roads_dataset
GROUP BY accident_id;

-- Total accidents per day of week
SELECT
	day_of_week,
    COUNT(accident_id) AS Total_Accident
FROM indian_roads_dataset
WHERE day_of_week IN ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')
GROUP BY day_of_week
ORDER BY day_of_week ASC;

-- 4. Sorting + Ranking
-- Top 5 cities with highest accidents
SELECT 
	city,
    count(accident_id) AS Total_count
FROM indian_roads_dataset
WHERE city IN ('Kolkata','Pune','Bangalore','Chandigarh','Chennai','Delhi','Hyderabad','Mumbai')
GROUP BY city
HAVING Total_count >2450
ORDER BY Total_count DESC;

-- Top states with highest casualties
SELECT 
	state,
    sum(casualties) AS Total_casualties
FROM indian_roads_dataset
WHERE state IN ('Delhi','Karnataka','Maharashtra','Punjab','Tamil Nadu','Telangana','West Bengal')
GROUP BY state
ORDER BY Total_casualties DESC;

-- Rank cities based on accident count
SELECT 
    city,
    COUNT(*) AS accident_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS city_rank
FROM indian_roads_dataset
GROUP BY city;

-- Find most dangerous day of the week
SELECT 
    day_of_week,
    COUNT(*) AS accident_count
FROM indian_roads_dataset
GROUP BY day_of_week
ORDER BY accident_count DESC
LIMIT 1;

-- 5. Intermediate SQL 
-- Cities with more than 100 accidents
SELECT 
    city,
    COUNT(*) AS accident_count
FROM indian_roads_dataset
GROUP BY city
HAVING COUNT(*) > 100
ORDER BY accident_count DESC;

-- States where avg risk_score > 0.43
SELECT 
    state,
    sum(risk_score)/count(risk_score) AS avg_risk_score
FROM indian_roads_dataset
GROUP BY state
HAVING AVG(risk_score) > 0.43
ORDER BY avg_risk_score DESC;

-- Road types with more than 50 severe accidents
SELECT 
    road_type,
    COUNT(*) AS severe_accident_count
FROM indian_roads_dataset
WHERE accident_severity = 'Fatal'
GROUP BY road_type
HAVING COUNT(*) > 50
ORDER BY severe_accident_count DESC;

-- Weather conditions causing most casualties
SELECT 
    weather,
    SUM(casualties) AS total_casualties
FROM indian_roads_dataset
GROUP BY weather
ORDER BY total_casualties DESC;

-- 6.CASE WHEN (Business Logic)
/*Categorize risk_score:
High (>0.7)
Medium (0.4–0.7)
Low (<0.4)
Label accidents:
"Severe" if casualties > 3
"Minor" otherwise
*/
SELECT 
    *,
    -- Risk Score Category
    CASE 
        WHEN risk_score > 0.7 THEN 'High'
        WHEN risk_score BETWEEN 0.4 AND 0.7 THEN 'Medium'
        ELSE 'Low'
    END AS risk_category,
    
    -- Accident Severity Label
    CASE 
        WHEN casualties > 3 THEN 'Severe'
        ELSE 'Minor'
    END AS accident_label

FROM indian_roads_dataset;