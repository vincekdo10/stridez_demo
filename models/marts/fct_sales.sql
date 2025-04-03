with orders as (
    select * from {{ ref('stg_orders') }}
),

sales_enriched as (
    select
        order_id,
        campaign_id,
        region,
        order_date,
        product_name,
        quantity,
        price_usd,
        quantity * price_usd as total_revenue
    from orders
)

select
    campaign_id,
    region,
    order_date,
    sum(total_revenue) as total_revenue,
    count(distinct order_id) as order_count,
    sum(quantity) as total_quantity
from sales_enriched
group by 1, 2, 3
