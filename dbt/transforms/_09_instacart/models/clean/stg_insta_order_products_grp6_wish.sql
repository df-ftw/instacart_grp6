{{config(materialized = "view", 
	engine = "MergeTree()", 
	order_by = ["order_id", "product_id"], 
	schema = "sandbox", 
	tags=["staging", "instacart_grp6"])}}

select 
    cast(tr.order_id as Int64) as order_id,
    cast(tr.product_id as Int64) as product_id,
    cast(tr.add_to_cart_order as Int64) as add_to_cart_order,
    cast(tr.reordered as Int64) as reordered
 from {{source('raw', 'raw___insta_order_products_train')}} tr
union all
select 
    cast(pr.order_id as Int64) as order_id,
    cast(pr.product_id as Int64) as product_id,
    cast(pr.add_to_cart_order as Int64) as add_to_cart_order,
    cast(pr.reordered as Int64) as reordered
from {{source('raw', 'raw___insta_order_products_prior')}} pr

 