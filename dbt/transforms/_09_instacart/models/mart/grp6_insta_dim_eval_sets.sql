{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT
    eval_set_id,
    eval_set_name
FROM {{ ref('stg_insta_eval_sets_grp6') }}