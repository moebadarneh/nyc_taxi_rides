with raw_yellow_trips as (
    select * from {{ source ('raw', 'yellow_trips')}}
)

sselect 
  VendorID,
  tpep_pickup_datetime as pickup_datetime,
  tpep_dropoff_datetime as dropoff_datetime,
  passenger_count,
  trip_distance,
  RatecodeID,
  store_and_fwd_flag,
  PULocationID,
  DOLocationID,
  payment_type,
  fare_amount,
  extra,
  mta_tax,
  tip_amount,
  tolls_amount,
  improvement_surcharge,
  total_amount,
  congestion_surcharge,
  airport_fee,
  partition_date
 from raw_yellow_trips;