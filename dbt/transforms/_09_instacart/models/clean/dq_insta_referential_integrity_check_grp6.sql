{{ config(
    materialized = "table",
    schema = "clean",
    tags = ["dq_check", "instacart_grp6"]
) }}

--check from child table insta_products is also existing to the parent table insta_aisles table
with dq_aisle_fk as(
    select now() as log_time,
    'insta_products' as table_group,
    'Referential Integrity (aisle_id to aisles)' as dq_test_type,
    count(*) as total_child_records,
    countIf(a.aisle_id is not null) as matched_parent_records,
    countIf(a.aisle_id is null) as unmatched_records
    from {{ ref('stg_insta_products_grp6') }} p 
    left join {{ ref('stg_insta_aisles_grp6') }} a
        on p.aisle_id = a.aisle_id 
),



final as (
    select * from dq_aisle_fk
)

select 
    log_time,
    table_group,
    dq_test_type,
    total_child_records,
    matched_parent_records,
    unmatched_records,
    round((unmatched_records * 100.0 / total_child_records),2) as percentage_of_unmatched,
    case when unmatched_records = 0 then 'PASS'
        else 'FAIL'
    end as dq_status
from final
order by dq_status

