with campaigns as (select * from {{ ref("tg_ad_campaigns") }})

SELECT
    campaign_id,
                            platform,
    region,
    campaign_date,
    sum(spend_usd) as total_spend,
    sum(impressions) as total_impressions,
    sum(clicks) as total_clicks







from campaigns
group by 1, 2, 3, 4
