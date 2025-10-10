{{ config(materialized = "table", schema = "clean", tags = ["staging", "instacartgrp6"]) }}
-- Lookup for evaluation sets (train, prior, test, etc.)
select
  row_number() over () as eval_set_id,
  trim(lower(eval_set)) as eval_set_name
from (
  select distinct eval_set
  from {{ source('raw', 'raw___insta_orders') }}
) as distinct_sets