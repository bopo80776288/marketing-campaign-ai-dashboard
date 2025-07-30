-- AI vs Traditional Campaign Performance Analysis
-- This query compares the effectiveness of AI-personalized campaigns vs traditional campaigns

SELECT 
    ai_personalized,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage,
    ROUND(AVG(conversions * 100.0 / clicks), 2) as avg_conversion_rate_percentage,
    ROUND(AVG(revenue * 1.0 / conversions), 2) as avg_revenue_per_conversion,
    ROUND(AVG(revenue * 1.0 / impressions), 4) as revenue_per_impression
FROM campaign_data
GROUP BY ai_personalized
ORDER BY ai_personalized DESC;

-- Additional analysis: AI performance by channel
SELECT 
    channel,
    ai_personalized,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage,
    ROUND(AVG(conversions * 100.0 / clicks), 2) as avg_conversion_rate_percentage
FROM campaign_data
GROUP BY channel, ai_personalized
ORDER BY channel, ai_personalized DESC;

-- Expected Results for AI vs Traditional:
-- AI_Personalized | Campaign Count | Total Impressions | Total Clicks | Total Conversions | Total Revenue | Avg CTR % | Avg Conversion Rate % | Avg Revenue per Conversion | Revenue per Impression
-- True           | 6              | 18000            | 2310         | 435              | 4630          | 12.83     | 18.83                | 10.64                    | 0.2572
-- False          | 3              | 9000             | 600          | 118              | 1250          | 6.67      | 19.67                | 10.59                    | 0.1389 