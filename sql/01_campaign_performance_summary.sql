-- Campaign Performance Summary Analysis
-- This query provides a high-level overview of campaign performance metrics

SELECT 
    channel,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage,
    ROUND(AVG(conversions * 100.0 / clicks), 2) as avg_conversion_rate_percentage,
    ROUND(AVG(revenue * 1.0 / conversions), 2) as avg_revenue_per_conversion
FROM campaign_data
GROUP BY channel
ORDER BY total_revenue DESC;

-- Expected Results:
-- Channel | Campaign Count | Total Impressions | Total Clicks | Total Conversions | Total Revenue | Avg CTR % | Avg Conversion Rate % | Avg Revenue per Conversion
-- Google  | 3             | 14500            | 1450         | 285              | 3150          | 10.00     | 19.66                | 11.05
-- Email   | 3             | 3500             | 860          | 150              | 1480          | 24.57     | 17.44                | 9.87
-- Facebook| 3             | 9000             | 600          | 118              | 1250          | 6.67      | 19.67                | 10.59 