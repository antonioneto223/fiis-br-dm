{{ config(
          materialized='table',
          unique_key=['ticker'],
          alias='dim_current_index',
          tags=['fiis_dm']
    )
}}

with

cte_rw as (
    select 
        *
        ,row_number() over(partition by ticker order by updated_at desc) as rw
    from {{ ref('base_fiis_indexes') }}
)

select 
    ticker as sk_ticker
    ,balance
    ,price_to_book
    ,dividend_yield
    ,assets_value
from cte_rw
    where rw = 1