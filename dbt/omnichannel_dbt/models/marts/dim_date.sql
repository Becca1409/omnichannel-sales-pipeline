{{ config(materialized='table') }}

select distinct
    sale_date as date_id,

    extract(year from sale_date)    as year,
    extract(month from sale_date)   as month,
    extract(day from sale_date)     as day,

    to_char(sale_date, 'Mon')       as month_name,
    to_char(sale_date, 'Day')       as day_name,

    case
        when extract(dayofweek from sale_date) in (0,6)
        then 'WEEKEND'
        else 'WEEKDAY'
    end as day_type

from {{ ref('fct_sales') }}
where sale_date is not null
