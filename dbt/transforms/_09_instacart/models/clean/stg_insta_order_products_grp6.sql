{{ config(
    materialized = "table",
    engine = "MergeTree()",
    order_by = ["order_id", "product_id"],
    schema = "clean",
    tags = ["staging", "instacart_grp6"]
) }}

with order_products_train as (
    select 
        cast(order_id as Int64) as order_id,
        cast(product_id as Int64) as product_id,
        cast(add_to_cart_order as Int64) as add_to_cart_order,
        cast(reordered as Int64) as reordered
    from {{ source('raw', 'raw___insta_order_products_train') }}
),

order_products_prior as (
    select 
        cast(order_id as Int64) as order_id,
        cast(product_id as Int64) as product_id,
        cast(add_to_cart_order as Int64) as add_to_cart_order,
        cast(reordered as Int64) as reordered
    from {{ source('raw', 'raw___insta_order_products_prior') }}
)

select * from order_products_train
union all
select * from order_products_prior
