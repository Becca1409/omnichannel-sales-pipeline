{{ config(materialized='view') }}

select
  order_id,
  product_id,
  seller_id,
  price,
  shipping_charges
from {{ source('shopify', 'order_items') }}
