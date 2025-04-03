with orders as (
    select * from {{ ref('stg_orders') }}
),

sales_enriched as (
    select
        campaign_id,
        region,
        order_date,
        product_name,  -- ✅ add this field
        quantity,
        price_usd,
        quantity * price_usd as total_revenue,
        order_id
    from orders
)

select
    campaign_id,
    region,
    order_date,
    product_name,
    sum(total_revenue) as total_revenue,
    count(distinct order_id) as order_count,
    sum(quantity) as total_quantity
from sales_enriched
group by 1, 2, 3, 4
