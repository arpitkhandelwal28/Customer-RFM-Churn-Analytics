# Customer RFM Segmentation & Churn Analytics
### SQL Server | Python | Power BI | Customer Analytics

An end-to-end customer analytics and retention solution built on approximately **1.06 million e-commerce transaction records** spanning two years (2009–2011).

This project transforms raw transaction data into actionable business insights through an automated SQL Server ETL pipeline, a Python-based RFM scoring and segmentation engine, and an interactive two-page Power BI executive dashboard.

---

## 1. Business Problem & Objectives

**Business Problem:**  
Businesses need to understand their most valuable customers, identify declining customer engagement, and develop effective retention strategies to reduce customer churn.

**Project Objectives:**
- Identify key revenue drivers and high-value customer segments.
- Evaluate customer retention across different geographical markets.
- Identify customers showing early signs of disengagement.
- Detect potential churn using a 90+ day inactivity threshold.
- Develop actionable retention and customer engagement strategies.

**RFM Segmentation:**  
A total of **5,881 unique customers** were classified into six actionable segments using Recency, Frequency, and Monetary (RFM) scoring with a 1–5 quantile scale.

The six segments are **Champions, Loyal, At Risk, Lost, Needs Attention, and New**.

---

## 2. Technology Stack & Architecture

| Technology | Implementation |
|---|---|
| SQL Server / SSMS | Data consolidation, cleaning, transformation, and deduplication |
| Python / Pandas | Customer-level aggregation, RFM scoring, segmentation, and churn identification |
| Power BI Desktop | Interactive dashboards, DAX measures, KPIs, and business insights |
| DAX | Dynamic calculations and performance metrics |
| JSON | Custom Power BI dashboard theme |

### Data Processing & ETL — SQL Server
- Consolidated multi-year transaction data using `UNION ALL`.
- Standardized multiple date formats using `COALESCE` and `TRY_CONVERT`.
- Performed null-value and outlier filtering.
- Removed duplicate records using `ROW_NUMBER()`.
- Prepared cleaned data for downstream analytics.

### Customer Analytics — Python
- Aggregated transaction data at the customer level.
- Calculated Recency, Frequency, and Monetary metrics.
- Applied vectorized quantile scoring using `pandas.qcut()` (1–5).
- Implemented rule-based RFM segmentation.
- Identified potentially churned customers using a 90-day inactivity threshold.

### Business Intelligence — Power BI
- Developed a two-page interactive executive dashboard.
- Created dynamic DAX measures:
  - Total Revenue
  - Total Customers
  - Churned %
  - Average Customer Value
- Implemented Selection Pane and Bookmark navigation.
- Added Customer vs. Revenue and Segment vs. Country toggles.
- Created a Clear All Slicers reset button.
- Used conditional formatting and heatmap matrices for comparative analysis.
- Applied a custom JSON theme.

---

## 3. Dashboard Preview

### Page 1: Business Overview

Provides an executive-level view of customer performance, revenue distribution, retention, and business trends.

**Key KPIs:**
- Total Customers: **5,881**
- Total Revenue: **$17M**
- Churned Rate: **50.9%**
- Average Customer Value: **$2,954**

Includes customer segment distribution, retention analysis, and monthly, quarterly, and yearly performance trends.

| Revenue View | Customer View |
|---|---|
| ![Revenue Overview](doc/image/Overview_Revenue.png) | ![Customer Overview](doc/image/Overview_Customer.png) |

### Page 2: RFM & Churn Analysis

Analyzes customer purchasing behavior, RFM scores, customer value, and churn patterns across different segments and international markets.

| Segment View | Country View |
|---|---|
| ![Segment RFM Analysis](doc/image/Segment_RFM.png) | ![Country RFM Analysis](doc/image/Country_RFM.png) |

---

## 4. Key Insights & Business Recommendations

The analysis identified six customer segments with different purchasing patterns and retention opportunities.

| Segment | Customers | Total Revenue | Avg. R | Avg. F | Avg. M | Avg. Customer Value |
|---|---:|---:|---:|---:|---:|---:|
| Champions | 1,263 | $10.91M | 4.71 | 4.87 | 4.83 | $9,169 |
| Loyal | 1,122 | $2.49M | 3.46 | 4.07 | 4.05 | $2,260 |
| At Risk | 1,023 | $1.78M | 1.69 | 3.65 | 3.77 | $1,800 |
| Lost | 1,790 | $752K | 2.78 | 2.05 | 1.91 | $421 |
| Needs Attention | 369 | $185K | 3.00 | 1.61 | 2.51 | $529 |
| New | 159 | $52K | 4.31 | 1.00 | 1.76 | $332 |

### Recommended Business Actions

| Segment | Recommended Strategy |
|---|---|
| Champions | Protect high-value customers through VIP loyalty programs, exclusive offers, and early access. |
| Loyal | Encourage higher-value purchases through personalized recommendations and product bundles. |
| At Risk | Launch automated win-back campaigns around Day 60, before the 90-day inactivity threshold. |
| Lost | Use cost-effective email campaigns and targeted re-engagement offers. |
| Needs Attention | Provide personalized product recommendations to encourage repeat purchases. |
| New | Introduce onboarding campaigns to encourage a second purchase within 30 days. |

### Major Business Findings

**1. Revenue Concentration**
- Champions account for approximately 21.5% of customers.
- They generate $10.91M, contributing 68.1% of total revenue.
- Their average customer value is $9,169.

**Recommendation:** Prioritize loyalty initiatives and protect this high-value customer base.

**2. High-Value Win-Back Opportunity**
- The At Risk segment contains 1,023 customers.
- These customers have generated approximately $1.78M in historical revenue.
- Their low average Recency score (1.69), combined with strong Frequency (3.65) and Monetary (3.77) scores, indicates an important retention opportunity.

**Recommendation:** Target these customers with personalized win-back campaigns before they become inactive for 90 days.

**3. Geographic Performance**
- The United Kingdom represents the core market with 5,353 customers and $14.39M revenue.
- Netherlands demonstrates strong customer engagement, with an average Recency score of 4.49 and Frequency score of 4.60.
- France also shows strong repeat engagement.
- EIRE leads international customer value with $123,314.

**Recommendation:** Study successful international markets to identify opportunities for improving customer engagement in other regions.

**4. Seasonal Churn Trends**
- Churn is highest in Q1 at 48.0%.
- March records a churn rate of 42.1%.
- Q4 churn decreases to 34.1%.
- November records the lowest monthly churn at 23.4%.

**Recommendation:** Introduce proactive retention campaigns during Q1 and use seasonal promotions to improve customer engagement.

---

## 5. Project Files

| File / Folder | Description |
|---|---|
| [IKEA Gifting BRD.docx](docs/IKEA%20Gifting%20BRD.docx) | Business Requirement Document outlining the project objectives, business requirements, KPI definitions, and analytical scope. |
| [IKEA RFM Segnentation.ipynb](notebook/IKEA%20RFM%20Segnentation.ipynb) | Jupyter Notebook containing the Python-based RFM analysis, customer scoring, segmentation, and churn analysis. |
| [ecommerce.sql](sql/ecommerce.sql) | SQL script for e-commerce transaction data preparation, cleaning, transformation, and analytical queries. |
| [EcommerceAnalytics.pbix](dashboard/EcommerceAnalytics.pbix) | Power BI dashboard containing the interactive customer, revenue, RFM segmentation, and churn analysis. |
| [Data folder & dataset details](Data.md) | Documents the raw and processed datasets, including the original transaction CSV files, cleaned data, and customer-level RFM output. Dataset downloads are provided through Google Drive. |
| [README.md](README.md) | Main project documentation covering the business problem, technology stack, dashboard previews, key insights, recommendations, and skills demonstrated. |

---

## 6. Skills Demonstrated

- **SQL Server:** Data Cleaning, ETL, CTEs, Window Functions, Data Transformation.
- **Python:** Pandas, Data Aggregation, Quantile Scoring, Business Logic.
- **Power BI:** Data Visualization, DAX, Bookmarks, Interactive Dashboards.
- **Business Analytics:** RFM Analysis, Customer Segmentation, Churn Analysis.
- **Business Skills:** KPI Development, Insight Generation, Data-Driven Recommendations.

---

## 7. Author & Contact

**Arpit Khandelwal**

- GitHub: [arpitkhandelwal28](https://github.com/arpitkhandelwal28)

If you find this project useful, consider giving the repository a ⭐ star!
