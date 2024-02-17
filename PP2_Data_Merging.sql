-- Data Merging
-- combining all the 12 months data tables into a single table containing data from Jan 2020 to Jan 2021.
CREATE TABLE `2020_cyclistic_data.2020_cyclistic_merged_data` AS (
  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.2020q1_cyclistic_data`

  UNION ALL
  
  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202004_cyclistic_data`

  UNION ALL

  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202005_cyclistic_data`

  UNION ALL

  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202005_cyclistic_data`

  UNION ALL
  
  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202006_cyclistic_data`

  UNION ALL
  
  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202007_cyclistic_data`

  UNION ALL

  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202009_cyclistic_data`

  UNION ALL

  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202010_cyclistic_data`

  UNION ALL

  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202011_cyclistic_data`

  UNION ALL

  SELECT
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
  FROM `2020_cyclistic_data.202012_cyclistic_data`

  UNION ALL

  SELECT 
   ride_id,
   rideable_type,
   started_at,
   ended_at,
   start_station_name,
   CAST(start_station_id AS STRING) AS start_station_id,
   end_station_name,
   CAST(end_station_id AS STRING) AS end_station_id,
   start_lat,
   start_lng,
   end_lat, 
   end_lng,
   member_casual 
   FROM `2020_cyclistic_data.202101_cyclistic_data`
);