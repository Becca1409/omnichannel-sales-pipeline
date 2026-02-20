{{ config(materialized='table') }}

with

/* ---------------------------------------------------------------
   ONLINE (Shopify-style CSVs)
   Grain: 1 row = 1 order item (one product line inside an order)
   But the orders info and order_items info are split in 2 tables
   (stg_orders and stg_order_items)
   So online_base is the 'merge them together' step
--------------------------------------------------------------- */
online_base as (
    select
        oi.order_id,
        o.customer_id,
        cast(o.order_purchase_timestamp as date) as sale_date,

        oi.product_id,
        oi.seller_id,

        oi.price                                   as revenue_amount,
        oi.shipping_charges                        as shipping_amount,

        /* If order_items has no item id, we create a stable-ish row id */
        row_number() over (
            partition by oi.order_id
            order by oi.product_id, oi.seller_id, oi.price, oi.shipping_charges
        ) as item_seq
        /* item_seq is needed because order_items table doesn't have a unique row identifier (such as order_item_id) */
    from {{ ref('stg_order_items') }} oi
    join {{ ref('stg_orders') }} o
      on oi.order_id = o.order_id
),

online_sales as (
    select
        /* Unique id for the fact row
         online_sales = reshape online_base into the unified fact-table structure */
        to_varchar(order_id) || '-' || to_varchar(item_seq) as sale_id,

        'ONLINE' as channel,

        /* shared columns */
        sale_date,
        order_id,
        customer_id,
        product_id,

        /* walmart-only fields -> NULL for online */
        null::number as store_id,
        null::number as holiday_flag,
        null::float  as temperature,
        null::float  as fuel_price,
        null::float  as cpi,
        null::float  as unemployment,

        /* metrics */
        revenue_amount,
        shipping_amount,
        (revenue_amount + shipping_amount) as gross_amount

    from online_base
),

/* ---------------------------------------------------------------------
   OFFLINE (Walmart CSV)
   Grain: 1 row per store + date
   offline_sales = take Walmart rows and reshape into the SAME structure
--------------------------------------------------------------------- */
offline_sales as (
    select
        'WALMART' || '-' || to_varchar(store) || '-' || to_varchar(date) as sale_id,

        'OFFLINE' as channel,

        date as sale_date,

        /* online-only fields -> NULL for offline */
        null::varchar as order_id,
        null::varchar as customer_id,
        null::varchar as product_id,

        /* shared-ish columns */
        store as store_id,

        /* walmart attributes */
        holiday_flag,
        temperature,
        fuel_price,
        cpi,
        unemployment,

        /* metrics */
        weekly_sales as revenue_amount,
        0::float     as shipping_amount,
        weekly_sales as gross_amount

    from {{ ref('stg_walmart_sales') }}
)

select * from online_sales
union all
select * from offline_sales

