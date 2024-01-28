{{ config(
          materialized='incremental',
          incremental_strategy='merge',
          unique_key=['ticker','date'],
          alias='base_hist_fiis',
          tags=['fiis_dm']
    )
}}

select 
    cast(Date as date) as Date
    ,ticker
    ,open
    ,high
    ,low
    ,close
    ,volume
    ,dividends
    ,adj_close
from {{source('bronze','hist_fiis')}}