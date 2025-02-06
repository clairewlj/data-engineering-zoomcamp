select count(*) from `dtc-de-course-449416.yellow_taxi.yellow_taxi_materialized`; --Q1 20,332,093

SELECT COUNT(DISTINCT PULocationID) from `dtc-de-course-449416.yellow_taxi.yellow_taxi_materialized`; --Q2 155.12
SELECT COUNT(DISTINCT PULocationID) from `dtc-de-course-449416.yellow_taxi.yellow_taxi_external`; --Q2 0

select PULocationID from `dtc-de-course-449416.yellow_taxi.yellow_taxi_materialized`; --Q3 155.12
select PULocationID, DOLocationID from `dtc-de-course-449416.yellow_taxi.yellow_taxi_materialized`; --Q3 310.24

select count(*) from `dtc-de-course-449416.yellow_taxi.yellow_taxi_materialized` where fare_amount=0; --Q4 8333

-- Q5 Partition by tpep_dropoff_datetime and Cluster on VendorID
CREATE OR REPLACE TABLE `dtc-de-course-449416.yellow_taxi.yellow_taxi_partitioned`
partition by date(tpep_dropoff_datetime) 
cluster by VendorID as 
select * from `dtc-de-course-449416.yellow_taxi.yellow_taxi_materialized`;

-- Q6
select distinct VendorID from `dtc-de-course-449416.yellow_taxi.yellow_taxi_materialized` where tpep_dropoff_datetime >= '2024-03-01' and tpep_dropoff_datetime <= '2024-03-15'; -- 310.24
select distinct VendorID from `dtc-de-course-449416.yellow_taxi.yellow_taxi_partitioned` where tpep_dropoff_datetime >= '2024-03-01' and tpep_dropoff_datetime <= '2024-03-15'; --26.84
