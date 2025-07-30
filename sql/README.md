# SQL Analysis Queries for Marketing Campaign AI Dashboard

This folder contains SQL queries for analyzing the marketing campaign dataset with AI personalization features.

## 📊 Query Files Overview

### 1. `01_campaign_performance_summary.sql`
**Purpose**: Basic campaign performance overview by channel
- **Key Metrics**: Total impressions, clicks, conversions, revenue
- **Calculated Metrics**: CTR, Conversion Rate, Revenue per Conversion
- **Use Case**: Executive dashboard, high-level reporting

### 2. `02_ai_vs_traditional_performance.sql`
**Purpose**: Compare AI-personalized vs traditional campaigns
- **Key Metrics**: Performance comparison between AI and non-AI campaigns
- **Calculated Metrics**: CTR, Conversion Rate, Revenue per Impression
- **Use Case**: AI effectiveness analysis, ROI justification

### 3. `03_regional_performance_analysis.sql`
**Purpose**: Geographic performance analysis
- **Key Metrics**: Performance by region and channel
- **Calculated Metrics**: Regional CTR, conversion rates, revenue
- **Use Case**: Geographic targeting optimization, regional strategy

### 4. `04_daily_trends_analysis.sql`
**Purpose**: Time-series analysis and trend identification
- **Key Metrics**: Daily performance trends
- **Calculated Metrics**: Day-over-day changes, moving averages
- **Use Case**: Trend analysis, seasonality detection

### 5. `05_roi_and_efficiency_analysis.sql`
**Purpose**: ROI and efficiency calculations
- **Key Metrics**: Revenue per impression, revenue per click
- **Calculated Metrics**: Efficiency rankings, top performers
- **Use Case**: Budget optimization, campaign prioritization

### 6. `06_advanced_analytics.sql`
**Purpose**: Advanced statistical analysis
- **Key Metrics**: Percentiles, rankings, correlations
- **Calculated Metrics**: Performance tiers, statistical measures
- **Use Case**: Deep analytics, performance benchmarking

## 🎯 Key Insights from SQL Analysis

### AI Performance Impact
- **AI campaigns show 92% higher CTR** (12.83% vs 6.67%)
- **Revenue per impression is 85% higher** with AI (0.2572 vs 0.1389)
- **AI campaigns generate 270% more revenue** ($4,630 vs $1,250)

### Channel Performance
- **Email**: Highest CTR (24.57%) but lower volume
- **Google**: Highest revenue ($3,150) and volume
- **Facebook**: Lowest CTR (6.67%) but stable conversion rates

### Regional Insights
- **West**: Highest revenue ($3,150) - Google campaigns
- **North**: Highest CTR (24.57%) - Email campaigns  
- **East**: Lower performance - Facebook campaigns only

## 📈 Business Recommendations

1. **Expand AI Personalization**: Focus on Facebook and Email channels
2. **Optimize Channel Mix**: Increase Email budget, optimize Facebook targeting
3. **Regional Strategy**: Invest more in West region, improve East performance
4. **ROI Focus**: Email campaigns provide best revenue per impression

## 🔧 Technical Notes

- **Database**: Compatible with PostgreSQL, MySQL, SQL Server
- **Data Format**: CSV import with proper data types
- **Performance**: All queries optimized for small to medium datasets
- **Extensions**: Uses window functions for advanced analytics

## 📋 Usage Instructions

1. Import `campaign_data.csv` into your database
2. Execute queries in order for comprehensive analysis
3. Modify date ranges and filters as needed
4. Export results for dashboard integration

## 🚀 Next Steps

- Create automated reporting schedules
- Build real-time dashboard connections
- Implement A/B testing queries
- Add predictive analytics models 