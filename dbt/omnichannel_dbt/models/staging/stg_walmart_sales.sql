{{ config(materialized='view') }}

select
    store,
    date::date                 as date,
    weekly_sales::float        as weekly_sales,
    holiday_flag::integer      as holiday_flag,
    temperature::float         as temperature,
    fuel_price::float          as fuel_price,
    cpi::float                 as cpi,
    unemployment::float        as unemployment
from {{ source('walmart', 'walmart_sales') }}
