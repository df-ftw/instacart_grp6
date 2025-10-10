{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT
    product_id,
    product_name
FROM {{ ref('stg_insta_products_grp6') }}