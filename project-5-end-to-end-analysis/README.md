 End-to-End Sales Performance Analysis (Excel + SQL + Looker Studio)

 Project Overview

This project analyzes a global sales dataset to uncover insights across regions, sales channels, product categories, and operational efficiency. The analysis was performed using Excel for initial preparation, SQL for data transformation and analysis, and Looker Studio for visualization.

 Objectives

The goal of this project is to:

* Identify top-performing regions and channels
* Analyze product-level profitability
* Evaluate operational efficiency using order priority and shipping performance
* Build an interactive dashboard for business decision-making

 Tools Used

* Excel (Data preparation and feature engineering)
* MySQL (Data transformation and analysis)
* Looker Studio (Dashboard and visualization)

 Data Preparation

* Cleaned and structured dataset in Excel
* Imported raw data into MySQL
* Created an analysis-ready table using SQL
* Engineered key features including:

  * Order Year and Month
  * Shipping Days
  * Shipping Category
  * Unit Margin
  * Profit Margin (calculated as SUM(Profit) / SUM(Revenue))

 Key Analysis Performed

* Revenue and profit comparison across regions
* Sales channel performance (Online vs Offline)
* Product category profitability analysis
* Operational efficiency analysis using order priority and shipping delays

 Key Insights

1. Sub-Saharan Africa and Europe lead in revenue and profit respectively, with relatively small differences, indicating balanced regional performance rather than dominance by a single region.

2. The Offline sales channel slightly outperforms Online in revenue and total profit, while profit margins remain nearly identical, indicating similar efficiency across both channels.

3. Cosmetics is the top profit-generating category, followed by Household and Office Supplies, while Fruits, Beverages, and Personal Care consistently underperform.

4. Product performance is consistent across both Online and Offline channels, suggesting that profitability is driven more by product category than by sales channel.

5. Order priority has minimal impact on delivery performance, as delayed shipments remain high across all priority levels, including Critical orders, indicating inefficiencies in the fulfillment process.

 Dashboard

The interactive dashboard includes:

* KPI summary (Revenue, Profit, Profit Margin)
* Revenue vs Profit by Region
* Channel Performance comparison
* Product Profitability ranking
* Operational Efficiency (Priority vs Shipping)
* Interactive filters for Region and Sales Channel

 Conclusion

This project demonstrates how combining Excel, SQL, and visualization tools can generate actionable business insights. The findings highlight the importance of product mix and operational improvements over simple revenue growth strategies.

 Files Included

* SQL queries (analysis.sql)
* Dataset (CSV)
* Dashboard screenshot
* README documentation
