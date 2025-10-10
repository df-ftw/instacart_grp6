{{ config(materialized = "table", schema = "clean", tags = ["staging", "instacartgrp6"]) }}
-- Keep one row per user; clean and cast IDs properly.
select
  cast(user_id as int) as user_id
from {{ source('raw', 'raw___insta_orders') }}
where user_id is not null
group by user_id