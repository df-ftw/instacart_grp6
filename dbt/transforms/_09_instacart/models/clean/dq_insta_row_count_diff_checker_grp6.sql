{{ config(
    materialized = "table",
    schema = "clean",
    tags = ["dq_check", "instacart_grp6"]
) }}

with dq_insta_aisles as (
    select
        now() as log_time,
        'insta_aisles' as table_group,
        'Row count comparison (raw vs clean)' as dq_test_type,
        (select count(*) from {{ source('raw', 'raw___insta_aisles') }}) as raw_count,
        (select count(*) from {{ ref('stg_insta_aisles_grp6') }}) as clean_count
        
),

dq_insta_department as (
    select
        now() as log_time,
        'insta_department' as table_group,
        'Row count comparison (raw vs clean)' as dq_test_type,
        (select count(*) from {{ source('raw', 'raw___insta_departments') }}) as raw_count,
        (select count(*) from {{ ref('stg_insta_department_grp6') }}) as clean_count
),

dq_insta_products as (
    select
        now() as log_time,
        'insta_products' as table_group,
        'Row count comparison (raw vs clean)' as dq_test_type,
        (select count(*) from {{ source('raw', 'raw___insta_products') }}) as raw_count,
        (select count(*) from {{ ref('stg_insta_products_grp6') }}) as clean_count
),

dq_insta_order_products as (
    select
        now() as log_time,
        'insta_order_products' as table_group,
        'Row count comparison (raw vs clean)' as dq_test_type,
        (select
                sum(raw_count)
            from (
                select count(*) as raw_count from {{ source('raw', 'raw___insta_order_products_prior') }}
                union all
                select count(*) as raw_count from {{ source('raw', 'raw___insta_order_products_train') }}
            ) t
        ) as raw_count,
        (select count(*) from {{ ref('stg_insta_order_products_grp6') }}) as clean_count
),

dq_insta_orders as (
    select
        now() as log_time,
        'insta_orders' as table_group,
        'Row count comparison (raw vs clean)' as dq_test_type,
        (
            (select count(*) from {{ source('raw', 'raw___insta_orders') }}) as raw_count,
            (select count(*) from {{ ref('stg_insta_orders_grp6') }}) as clean_count
        )
),

final as (
    select
        log_time,
        table_group,
        dq_test_type,
        raw_count,
        clean_count,
        (clean_count - raw_count) as row_diff,
        case
            when clean_count = raw_count then 'PASS'
            else 'MISMATCH'
        end as dq_status
    from dq_insta_aisles

    union all

    select
        log_time,
        table_group,
        dq_test_type,
        raw_count,
        clean_count,
        (clean_count - raw_count) as row_diff,
        case
            when clean_count = raw_count then 'PASS'
            else 'MISMATCH'
        end as dq_status
    from dq_insta_department

    union all

    select
        log_time,
        table_group,
        dq_test_type,
        raw_count,
        clean_count,
        (clean_count - raw_count) as row_diff,
        case
            when clean_count = raw_count then 'PASS'
            else 'MISMATCH'
        end as dq_status
    from dq_insta_products

    union all

    select
        log_time,
        table_group,
        dq_test_type,
        raw_count,
        clean_count,
        (clean_count - raw_count) as row_diff,
        case
            when clean_count = raw_count then 'PASS'
            else 'MISMATCH'
        end as dq_status
    from dq_insta_order_products
)

select * from final
