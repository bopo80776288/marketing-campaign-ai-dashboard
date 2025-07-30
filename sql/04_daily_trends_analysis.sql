-- Daily Trends Analysis
-- This query analyzes performance trends over time to identify patterns and seasonality

-- Daily performance summary
SELECT 
    date,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage,
    ROUND(AVG(conversions * 100.0 / clicks), 2) as avg_conversion_rate_percentage
FROM campaign_data
GROUP BY date
ORDER BY date;

-- Daily performance by channel
SELECT 
    date,
    channel,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage
FROM campaign_data
GROUP BY date, channel
ORDER BY date, channel;

-- Daily AI vs Traditional performance
SELECT 
    date,
    ai_personalized,
    COUNT(*) as campaign_count,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage
FROM campaign_data
GROUP BY date, ai_personalized
ORDER BY date, ai_personalized DESC;

-- Performance change day-over-day (using window functions)
SELECT 
    date,
    channel,
    impressions,
    clicks,
    conversions,
    revenue,
    LAG(impressions) OVER (PARTITION BY channel ORDER BY date) as prev_impressions,
    LAG(clicks) OVER (PARTITION BY channel ORDER BY date) as prev_clicks,
    ROUND(((clicks - LAG(clicks) OVER (PARTITION BY channel ORDER BY date)) * 100.0 / 
           LAG(clicks) OVER (PARTITION BY channel ORDER BY date)), 2) as clicks_change_percentage
FROM campaign_data
ORDER BY channel, date;

-- Expected Results for Daily Trends:
-- Date       | Campaign Count | Total Impressions | Total Clicks | Total Conversions | Total Revenue | Avg CTR % | Avg Conversion Rate %
-- 2024-06-01 | 3             | 9200             | 1000         | 190              | 2020          | 10.87     | 19.00
-- 2024-06-02 | 3             | 8900             | 950          | 183              | 1940          | 10.67     | 19.26
-- 2024-06-03 | 3             | 8900             | 960          | 180              | 1920          | 10.79     | 18.75 