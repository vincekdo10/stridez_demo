with source as (
    select * from {{ source('raw', 'ad_campaigns') }}
)

select
    campaign_id,
    platform,
    campaign_name,
    region,
    spend_usd,
    impressions,
    clicks,
    date as campaign_date
from source
