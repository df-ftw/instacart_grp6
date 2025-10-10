{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT
    op.order_id,
    op.product_id,
    op.add_to_cart_order,
    op.reordered
FROM {{ ref('stg_insta_order_products_grp6') }} op