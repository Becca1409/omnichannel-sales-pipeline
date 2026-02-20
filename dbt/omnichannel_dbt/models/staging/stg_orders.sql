{{ config(materialized='view') }}

select
  order_id,
  customer_id,
  order_purchase_timestamp,
  order_approved_at
from {{ source('shopify', 'orders') }}
