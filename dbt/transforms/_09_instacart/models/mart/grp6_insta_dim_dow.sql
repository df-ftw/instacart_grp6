{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT DISTINCT
    order_dow,
    CASE order_dow
        WHEN 0 THEN 'Sunday'
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
    END AS name_of_day
FROM {{ ref('stg_insta_orders_grp6') }}
WHERE order_dow IS NOT NULL