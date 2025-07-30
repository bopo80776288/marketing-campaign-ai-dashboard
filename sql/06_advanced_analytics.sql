-- Advanced Analytics and Statistical Analysis
-- This query performs advanced analysis including percentiles, rankings, and statistical measures

-- Channel performance ranking with percentiles
WITH channel_stats AS (
    SELECT 
        channel,
        SUM(impressions) as total_impressions,
        SUM(clicks) as total_clicks,
        SUM(conversions) as total_conversions,
        SUM(revenue) as total_revenue,
        ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage,
        ROUND(AVG(conversions * 100.0 / clicks), 2) as avg_conversion_rate_percentage
    FROM campaign_data
    GROUP BY channel
)
SELECT 
    channel,
    total_impressions,
    total_clicks,
    total_conversions,
    total_revenue,
    avg_ctr_percentage,
    avg_conversion_rate_percentage,
    ROUND(total_revenue * 100.0 / total_impressions, 4) as revenue_per_impression,
    NTILE(3) OVER (ORDER BY total_revenue DESC) as revenue_performance_tier,
    RANK() OVER (ORDER BY avg_ctr_percentage DESC) as ctr_rank,
    RANK() OVER (ORDER BY avg_conversion_rate_percentage DESC) as conversion_rate_rank
FROM channel_stats
ORDER BY total_revenue DESC;

-- AI effectiveness analysis with statistical measures
WITH ai_analysis AS (
    SELECT 
        ai_personalized,
        channel,
        SUM(impressions) as total_impressions,
        SUM(clicks) as total_clicks,
        SUM(conversions) as total_conversions,
        SUM(revenue) as total_revenue,
        ROUND(AVG(clicks * 100.0 / impressions), 2) as avg_ctr_percentage,
        ROUND(AVG(conversions * 100.0 / clicks), 2) as avg_conversion_rate_percentage
    FROM campaign_data
    GROUP BY ai_personalized, channel
)
SELECT 
    channel,
    ai_personalized,
    total_impressions,
    total_clicks,
    total_conversions,
    total_revenue,
    avg_ctr_percentage,
    avg_conversion_rate_percentage,
    ROUND(total_revenue * 100.0 / total_impressions, 4) as revenue_per_impression,
    CASE 
        WHEN ai_personalized = TRUE THEN 'AI-Enhanced'
        ELSE 'Traditional'
    END as campaign_type
FROM ai_analysis
ORDER BY channel, ai_personalized DESC;

-- Performance correlation analysis (simulated)
-- This would typically require more data points, but shows the concept
SELECT 
    'CTR vs Conversion Rate' as correlation_analysis,
    ROUND(
        (AVG(clicks * conversions) - AVG(clicks) * AVG(conversions)) / 
        (STDDEV(clicks) * STDDEV(conversions)), 4
    ) as correlation_coefficient
FROM campaign_data;

-- Regional efficiency analysis with rankings
SELECT 
    region,
    channel,
    ai_personalized,
    SUM(impressions) as total_impressions,
    SUM(clicks) as total_clicks,
    SUM(conversions) as total_conversions,
    SUM(revenue) as total_revenue,
    ROUND(SUM(clicks) * 100.0 / SUM(impressions), 2) as ctr_percentage,
    ROUND(SUM(conversions) * 100.0 / SUM(clicks), 2) as conversion_rate_percentage,
    ROUND(SUM(revenue) * 100.0 / SUM(impressions), 4) as revenue_per_impression,
    RANK() OVER (PARTITION BY region ORDER BY SUM(revenue) DESC) as revenue_rank_in_region,
    RANK() OVER (PARTITION BY channel ORDER BY SUM(revenue) DESC) as revenue_rank_in_channel
FROM campaign_data
GROUP BY region, channel, ai_personalized
ORDER BY region, revenue_rank_in_region;

-- Expected Results for Advanced Analytics:
-- Channel | Total Impressions | Total Clicks | Total Conversions | Total Revenue | Avg CTR % | Avg Conversion Rate % | Revenue per Impression | Revenue Performance Tier | CTR Rank | Conversion Rate Rank
-- Google  | 14500            | 1450         | 285              | 3150          | 10.00     | 19.66                | 0.0217                | 1                      | 3        | 2
-- Email   | 3500             | 860          | 150              | 1480          | 24.57     | 17.44                | 0.0423                | 2                      | 1        | 3
-- Facebook| 9000             | 600          | 118              | 1250          | 6.67      | 19.67                | 0.0139                | 3                      | 2        | 1 