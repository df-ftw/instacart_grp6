{{config(materialized = "table", 
	engine = "MergeTree()", 
	order_by = ["aisle_id"], 
	schema = "clean", 
	tags=["staging", "instacart_grp6"])}}

with insta_aisles as (
select DISTINCT 
  cast(aisle_id as Int64) as aisle_id,
  trim(initcap(lower(cast(aisle as Nullable(String))))) as aisle
 from {{source('raw', 'raw___insta_aisles')}}
 where aisle_id is not null
)
select *
from insta_aisles
