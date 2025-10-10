{{ config(materialized = "table", schema = "clean", tags = ["staging", "instacartgrp6"]) }}
-- Clean orders table with FK references to users and eval_sets
select
  cast(o.order_id as int) as order_id,
  cast(o.user_id as int) as user_id,
  cast(e.eval_set_id as int) as eval_set_id,
  cast(o.order_number as int) as order_number,
  cast(o.order_dow as int) as order_dow,
  cast(o.order_hour_of_day as int) as order_hour_of_day,
  -- Handle missing or NaN values properly
  case
    when lower(o.days_since_prior_order) in ('', 'nan') then null
    else cast(o.days_since_prior_order as float)
  end as days_since_prior_order
from {{ source('raw', 'raw___insta_orders') }} as o
join {{ ref('stg_insta_eval_sets_grp6') }} as e
  on trim(lower(o.eval_set)) = e.eval_set_name