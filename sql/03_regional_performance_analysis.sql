-- Regional Performance Analysis
-- This query analyzes campaign performance by region to identify geographic trends

SELECT 
    region,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage,
    ROUND(AVG(conversions * 100.0 / clicks), 2) as avg_conversion_rate_percentage,
    ROUND(AVG(revenue * 1.0 / conversions), 2) as avg_revenue_per_conversion
FROM campaign_data
GROUP BY region
ORDER BY total_revenue DESC;

-- Regional performance by channel
SELECT 
    region,
    channel,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage
FROM campaign_data
GROUP BY region, channel
ORDER BY region, total_revenue DESC;

-- Regional AI adoption analysis
SELECT 
    region,
    ai_personalized,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage
FROM campaign_data
GROUP BY region, ai_personalized
ORDER BY region, ai_personalized DESC;

-- Expected Results for Regional Analysis:
-- Region | Campaign Count | Total Impressions | Total Clicks | Total Conversions | Total Revenue | Avg CTR % | Avg Conversion Rate % | Avg Revenue per Conversion
-- West   | 3             | 14500            | 1450         | 285              | 3150          | 10.00     | 19.66                | 11.05
-- North  | 3             | 3500             | 860          | 150              | 1480          | 24.57     | 17.44                | 9.87
-- East   | 3             | 9000             | 600          | 118              | 1250          | 6.67      | 19.67                | 10.59 