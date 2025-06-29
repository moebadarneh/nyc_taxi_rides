{{
  config(
    materialized = 'view',

    )
}}


with raw_green_trips as (

    select * from  {{ ref('raw_green_trips') }}
  
)


  select 
      {{ dbt_utils.generate_surrogate_key(['vendor_id', 'pickup_datetime','dropoff_datetime','pickup_location_id' ,'dropoff_location_id']) }} as trip_id,
      vendor_id,
      pickup_datetime,
      dropoff_datetime,
      pickup_location_id,
      dropoff_location_id,
      passenger_count,
      trip_distance,
      rate_code_id,
      store_and_fwd_flag,
      payment_type,
      {{ get_payment_type_description('payment_type') }} as payment_type_description,
      fare_amount,
      extra,
      mta_tax,
      tip_amount,
      tolls_amount,
      improvement_surcharge,
      total_amount,
      trip_type,
      congestion_surcharge
    from raw_green_trips