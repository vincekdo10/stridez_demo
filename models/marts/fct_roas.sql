with sales as (
    select * from {{ ref('fct_sales') }}
),

ads as (
    select * from {{ ref('fct_ad_performance') }}
),

joined as (
    select
        ads.campaign_id,
        ads.platform,
        ads.region,
        ads.campaign_date as date,
        ads.total_spend,
        sales.total_revenue,
        sales.order_count,
        sales.total_quantity
    from ads
    left join sales
        on ads.campaign_id = sales.campaign_id
        and ads.region = sales.region
        and ads.campaign_date = sales.order_date
)

select
    campaign_id,
    platform,
    region,
    date,
    total_spend,
    total_revenue,
    order_count,
    total_quantity,
    case
        when total_spend > 0 then round(total_revenue / total_spend, 2)
        else null
    end as roas
from joined
