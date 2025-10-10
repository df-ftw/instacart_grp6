{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT
    aisle_id,
    aisle
FROM {{ ref('stg_insta_aisles_grp6') }}