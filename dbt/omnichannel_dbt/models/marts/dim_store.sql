{{ config(materialized='table') }}

select distinct
    store_id,
    /* label for nicer dashboards */
    'Store ' || to_varchar(store_id) as store_name
from {{ ref('fct_sales') }}
where store_id is not null
