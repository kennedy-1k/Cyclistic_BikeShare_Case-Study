# Cyclistic Bike-Share Case Study
## Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share & Act.

**Quick Links:**

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) 

SQL Queries:
1. [Data Merging](PP2_Data_Merging.sql)
2. [Data Exploration](PP2_Data_Exploration.sql)
3. [Data Cleaning](PP2_Data_Cleaning.sql)
4. [Data Analysis](PP2_Data_Analysis.sql)

Data Visualizations: [Tableau](https://public.tableau.com/views/PP2_17050994902820/Sheet5?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

## Background
### Cyclistic
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Scenario
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
### Business Task
Devise marketing strategies to convert casual riders to members.

### Analysis Questions
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2020 to Jan 2021 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [License](https://divvybikes.com/data-license-agreement)

This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders personal identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single day passes.

### Data Organisation 
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
BigQuery is used to combine the various datasets into one dataset and clean it.

**Reason:**

A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has millions of rows, it is essential to use a platform like BigQuery that supports huge volumes of data.

### Merging the Data
**SQL Query:** [Data Merging](PP2_Data_Merging.sql)

12 csv files are uploaded as tables in the dataset '2020_cyclistic_data'. Another table named "2020_cyclistic_merged_data" is created, containing 3,216,430 rows of data for the entire year.

## Data Exploration
**SQL Query:** [Data Exploration](PP2_Data_Exploration.sql)

Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.

**Observations:**
1. The table below shows the all column names and their data types. The *ride_id* column is our primary key.
<img width="157" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/b4b748ea-7178-4e69-bed8-c6fd70d3c6bf">

2. The following table shows number of null values in each column.
<img width="626" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/45651d9c-8673-411d-9a0d-206842bf67dd">

Note that some columns have same number of missing values. This may be due to missing information in the same row i.e. station's name and id for the same station and latitude and longitude for the same ending station.

3. As ride_id has no null values, let's use it to check for duplicates.
<img width="331" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/f1e0d767-401f-4ba9-b41f-ea44819cc7c4">

There are no duplicate rows in the data.

4. All ride_id values have length of 16 sothere is no need to clean it.
5. There are 3 unique types of bikes(rideable_type) in our data.
<img width="260" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/e33214d4-0560-4fc0-9c54-53199b3e1ac2">

6. The started_at and ended_at shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. New column ride_length can be created to find the total trip duration. There are 2598 trips which has duration longer than a day and 53917 trips having less than a minute duration or having end time earlier than start time so we need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.

7. Total of 96216 rows have both start_station_name and start_station_id missing which needs to be removed.

8. Total of 111830 rows have both end_station_name and end_station_id missing which needs to be removed.

9. Total of 3741 rows have both end_lat and end_lng missing which needs to be removed.

10. *member_casual* column has 2 uniqued values as member or casual rider.
<img width="260" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/ae04ca06-62d8-458f-b94a-fac096619300">

11. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map

## Data Cleaning
**SQL Query:** [Data Cleaning](PP2_Data_Cleaning.sql)

1. All the rows having missing values are deleted.
2. 3 more columns *ride_length* for duration of the trip, *day_of_week* and *month* are added.
3. Trips with duration less than a minute and longer than a day are excluded.
4. Millions of rows were removed in this step.

## Analyze and Share
**SQL Query:** [Data Analysis](PP2_Data_Analysis.sql)

**Data Visualization:** [Tableau](https://public.tableau.com/views/PP2_17050994902820/Sheet5?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.

The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?

First of all, member and casual riders are compared by the type of bikes they are using.

<img width="286" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/72092174-5da9-49b5-a329-1036bc914661">

Each bike type chart shows percentage from the total. Most used bike is classic bike followed by the electric bike. Docked bikes are used the least by only casual riders.

Next the number of trips distributed by the months and ays of the week are examined.
<img width="908" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/a9361cc3-19c1-4ede-9975-cf6dc0c67587">
<img width="939" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/e5f262f3-e079-47aa-8639-ac3de91bbf63">

**Months:** When it comes to monthly trips, both casual and members exhibit comparable behavior, with more trips in the spring and summer and fewer in the winter. The gap between casuals and members is closest in the month of july in summmer.

**Days of Week:** When the days of the week are compared, it is discovered that casual riders make more journeys on the weekends while members show a decline over the weekend in contrast to the other days of the week.

We can infer from the previous observations that member may be using bikes for commuting to and from the work in the week days while casual riders are using bikes throughout the day, more frequently over the weekends for leisure purposes. Both are most active in summer and spring.

Ride duration of the trips are compared to find the differences in the behavior of casual and member riders.
<img width="937" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/0d949a3a-ea5f-44a0-bc7a-edfa2de155bc">
<img width="933" alt="image" src="https://github.com/kennedy-1k/Cyclistic_BikeShare_Case-Study/assets/107962983/d633bf87-33b5-4000-94e6-769e9f314c22">

Take note that casual riders tend to cycle longer than members do on average. The length of the average journey for members doesn't change throughout the year, week, or day. However, there are variations in how long casual riders cycle. In the spring and summer, on weekends, they travel greater distances. 

These findings lead to the conclusion that casual commuters travel longer (approximately 2x more) but less frequently than members. They make longer journeys on weekends and during the day outside of commuting hours and in spring and summer season, so they might be doing so for recreation purposes.

## Act
After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.

**Recommendations:**
1. Casual riders are most active on weekends and during the summer and spring, thus they may be offered seasonal or weekend-only memberships.
2. Casual riders use their bikes for longer durations than members. Offering discounts for longer rides may incentivize casual riders and entice members to ride for longer periods of time.

