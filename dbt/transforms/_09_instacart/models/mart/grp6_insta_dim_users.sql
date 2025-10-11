{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT
    user_id
FROM {{ ref('stg_insta_users_grp6') }}