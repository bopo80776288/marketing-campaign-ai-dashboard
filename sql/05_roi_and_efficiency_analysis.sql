-- ROI and Efficiency Analysis
-- This query calculates various ROI metrics and efficiency indicators for campaign optimization

-- Overall ROI analysis by channel
SELECT 
    channel,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(SUM(revenue) * 100.0 / SUM(impressions), 4) as revenue_per_impression,
    ROUND(SUM(revenue) * 100.0 / SUM(clicks), 2) as revenue_per_click,
    ROUND(SUM(revenue) * 1.0 / SUM(conversions), 2) as revenue_per_conversion,
    ROUND(SUM(conversions) * 100.0 / SUM(impressions), 4) as conversion_rate_per_impression
FROM campaign_data
GROUP BY channel
ORDER BY total_revenue DESC;

-- ROI analysis by AI personalization
SELECT 
    ai_personalized,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(SUM(revenue) * 100.0 / SUM(impressions), 4) as revenue_per_impression,
    ROUND(SUM(revenue) * 100.0 / SUM(clicks), 2) as revenue_per_click,
    ROUND(SUM(revenue) * 1.0 / SUM(conversions), 2) as revenue_per_conversion
FROM campaign_data
GROUP BY ai_personalized
ORDER BY ai_personalized DESC;

-- Efficiency ranking by channel and AI status
SELECT 
    channel,
    ai_personalized,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(SUM(clicks) * 100.0 / SUM(impressions), 2) as ctr_percentage,
    ROUND(SUM(conversions) * 100.0 / SUM(clicks), 2) as conversion_rate_percentage,
    ROUND(SUM(revenue) * 100.0 / SUM(impressions), 4) as revenue_per_impression,
    ROUND(SUM(revenue) * 1.0 / SUM(conversions), 2) as revenue_per_conversion
FROM campaign_data
GROUP BY channel, ai_personalized
ORDER BY revenue_per_impression DESC;

-- Top performing campaigns (individual records)
SELECT 
    date,
    channel,
    region,
    ai_personalized,
    impressions,
    clicks,
    conversions,
    revenue,
    ROUND(clicks * 100.0 / impressions, 2) as ctr_percentage,
    ROUND(conversions * 100.0 / clicks, 2) as conversion_rate_percentage,
    ROUND(revenue * 100.0 / impressions, 4) as revenue_per_impression
FROM campaign_data
ORDER BY revenue_per_impression DESC
LIMIT 5;

-- Expected Results for ROI Analysis:
-- Channel | Total Impressions | Total Clicks | Total Conversions | Total Revenue | Revenue per Impression | Revenue per Click | Revenue per Conversion | Conversion Rate per Impression
-- Google  | 14500            | 1450         | 285              | 3150          | 0.0217                | 2.17              | 11.05                | 1.97
-- Email   | 3500             | 860          | 150              | 1480          | 0.0423                | 1.72              | 9.87                 | 4.29
-- Facebook| 9000             | 600          | 118              | 1250          | 0.0139                | 2.08              | 10.59                | 1.31 