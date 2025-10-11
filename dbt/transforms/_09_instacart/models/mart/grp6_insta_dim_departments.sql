{{ config(materialized = "table", schema = "mart", tags = ["mart", "instacartgrp6"]) }}

SELECT
    department_id,
    department
FROM {{ ref('stg_insta_department_grp6') }}