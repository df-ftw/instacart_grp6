{{config(materialized = "table", 
	engine = "MergeTree()", 
	order_by = ["product_id"], 
	schema = "clean", 
	tags=["staging", "instacart_grp6"])}}

with insta_products as (
select DISTINCT 
  cast(product_id as Int64) as product_id,
  trim(initcap(lower(cast(product_name as Nullable(String))))) as product_name,
  cast(aisle_id as Int64) as aisle_id,
  cast(department_id as Int64) as department_id
 from {{source('raw', 'raw___insta_products')}}
 where product_id is not null
)
select *
from insta_products
