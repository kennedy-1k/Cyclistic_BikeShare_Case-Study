-- Data Cleaning
DROP TABLE IF EXISTS `2020_cyclistic_data.2020_cyclistic_cleaned_merged_data`;

-- Creating a new table with clean data
CREATE TABLE IF NOT EXISTS `2020_cyclistic_data.2020_cyclistic_cleaned_merged_data` AS (
  SELECT
    a.ride_id, rideable_type, started_at, ended_at, ride_length,
     CASE EXTRACT(DAYOFWEEK FROM started_at)
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'  
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng, member_casual
  FROM `2020_cyclistic_data.2020_cyclistic_merged_data` a
  JOIN (
    SELECT ride_id, (
      EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
      EXTRACT(MINUTE FROM (ended_at - started_at)) +
      EXTRACT(SECOND FROM (ended_at - started_at)) / 60) AS ride_length
    FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
 ) b
ON a.ride_id = b.ride_id
 WHERE 
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_length > 1 AND ride_length < 1440
);

-- set ride_id as primary key
ALTER TABLE `2020_cyclistic_data.2020_cyclistic_cleaned_merged_data`
ADD PRIMARY KEY (ride_id) NOT ENFORCED;

-- returned 3409022 rows
SELECT COUNT(ride_id) AS no_of_rows_cleaned_merged
FROM `2020_cyclistic_data.2020_cyclistic_cleaned_merged_data`;