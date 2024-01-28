{{ config(
          materialized='table',
          unique_key=['sk_date'],
          alias='dim_calendar',
          tags=['fiis_dm']
    )
}}

with all_dates as (
    select 
        Dates
    from {{ ref('base_hist_fiis') }}
    group by 1
)

select 
    Dates as sk_date,
    extract(DAY from Dates) as day,
    extract(MONTH from Dates)  as month,
    extract(YEAR from Dates)  as year
from all_dates
