 Customer Segmentation Analysis (SQL)

 Project Overview

This project analyzes customer purchasing behavior using transactional retail data. The goal is to identify distinct customer segments based on purchasing patterns and generate actionable business insights.

Objective

The analysis focuses on identifying high-value customers, understanding purchase frequency and spending behavior, detecting customers at risk of churn, and providing insights that support targeted business decisions.

Tools Used

SQL (MySQL) was used for data querying and analysis, while Excel was used for initial exploration. GitHub was used for documentation and version control.

Dataset

The dataset consists of retail transaction records, with approximately 23,000 cleaned observations after preprocessing. Key fields include Customer ID, Invoice, Quantity, Price, and Invoice Date.

Data Cleaning

The dataset was cleaned by removing records with missing Customer IDs, filtering out negative quantities representing returns, and excluding transactions with zero or negative prices. This ensured that only valid purchase transactions were included in the analysis.

Analysis Approach

Customer-level aggregation was performed to calculate total orders, total spending, average order value, and last purchase date for each customer.

RFM analysis was applied using recency, frequency, and monetary metrics. Recency measured the number of days since a customer’s last purchase, frequency measured the number of transactions, and monetary value measured total spending.

Customers were then segmented into High Value, Frequent Buyers, At Risk, and Regular Customers based on their RFM scores.

Key Insights

High-value customers represent a small portion of the customer base but contribute significantly to total revenue. These customers should be prioritized for retention strategies such as loyalty programs and exclusive offers.

Frequent Buyers make regular purchases but have moderate spending levels. This group presents an opportunity for upselling and increasing average order value.

At-risk customers have not made recent purchases and are likely to churn. Targeted re-engagement strategies, such as promotions and reminders, can help recover these customers.

Regular Customers form a large portion of the customer base but contribute relatively low revenue. Engagement strategies can be applied to improve their activity, or they may be deprioritized depending on business goals.

Conclusion

This project demonstrates how customer segmentation can support better business decision-making by identifying valuable customers, reducing churn, and improving marketing effectiveness.

Key Skills Demonstrated

SQL querying and aggregation, data cleaning and preprocessing, customer segmentation using RFM analysis, and translating data findings into business insights.


## Dataset Access

The dataset used for this project is publicly available. Due to file size limitations, it is not included in this repository.

You can download it here: https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci
