-- Data Exploration

-- checking for number of null values in all columns
SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`;

-- checking for duplicate rows
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`;

-- ride_id - all have length of 16
SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
GROUP BY length_ride_id;

-- rideable_type - 3 unique types of bikes
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
GROUP BY rideable_type;

-- started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC
SELECT started_at, ended_at
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
LIMIT 10;

-- longer than a day - total rows = 2598
SELECT COUNT(*) AS longer_than_a_day
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
WHERE(
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;

-- less than a minute - total rows = 53917
SELECT COUNT(*) AS less_than_a_minute
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
WHERE(
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1;

-- start_station_name, start_station_id - total 96216 rows with both start station name and id missing
SELECT DISTINCT start_station_name
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_start_station_null
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
WHERE start_station_name IS NULL OR start_station_id IS NULL;

-- end_station_name, end_station_id - total 111830 rows with both end station name and id missing
SELECT DISTINCT end_station_name
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
ORDER BY end_station_name;

SELECT COUNT(ride_id) AS rows_with_end_station_null
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

-- end_lat, end_lng - total 3741 rows with both missing
SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
WHERE end_lat IS NULL OR end_lng IS NULL;

-- member_casual - 2 unique values - member and casual riders
SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `2020_cyclistic_data.2020_cyclistic_merged_data`
GROUP BY member_casual;