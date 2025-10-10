{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT
    o.order_id,
    o.user_id,
    o.eval_set_id,
    o.order_number,
    o.order_dow,
    o.order_hour_of_day,
    o.days_since_prior_order
FROM {{ ref('stg_insta_orders_grp6') }} o