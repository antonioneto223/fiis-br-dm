{{ config(
          materialized='table',
          unique_key=['ticker','date'],
          alias='base_fiis_indexes',
          tags=['fiis_dm']
    )
}}

select 
    ticker
    ,cast(balance as integer) as balance
    ,cast(price_to_book as decimal) as price_to_book
    ,cast(dividend_yield as decimal) as dividend_yield
    ,cast(assets_value as integer) as assets_value
from {{source('bronze','fiis_indexes')}}