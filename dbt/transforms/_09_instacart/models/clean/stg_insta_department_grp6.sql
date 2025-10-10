{{config(materialized = "table", 
	engine = "MergeTree()", 
	order_by = ["department_id"], 
	schema = "clean", 
	tags=["staging", "instacart_grp6"])}}

with insta_department as (
select DISTINCT 
  cast(department_id as Int64) as department_id,
  trim(initcap(lower(cast(department as Nullable(String))))) as department
 from {{source('raw', 'raw___insta_departments')}}
 where department_id is not null
)
select *
from insta_department
order by department