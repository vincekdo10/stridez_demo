with source as (
    select * from {{ source('raw', 'orders') }}
)

select
    order_id,
    campaign_id,
    product_name,
    price_usd,
    quantity,
    region,
    date as order_date
from source
