{{ config(
          materialized='table',
          unique_key=['ticker','sk_date'],
          alias='ft_ticker_values',
          tags=['fiis_dm']
    )
}}

select 
    ticker as sk_ticker,
    Dates as sk_date,
    open,
    high,
    low,
    close,
    dividends
from {{ ref('base_hist_fiis') }}