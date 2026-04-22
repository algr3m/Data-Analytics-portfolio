**E-commerce Sales & Loss Analysis (SQL)
Objective**

To analyze sales data and identify key drivers of profitability and loss using SQL queries.
Tools Used
MySQL
SQL (Aggregation, Filtering, CASE statements)
Key Insights
Office Supplies has the highest frequency of loss-making transactions. 
Furniture contributes the highest total loss due to high-value items. 
Technology has the highest loss per transaction, indicating a higher risk per sale. 
Profitability declines significantly at higher discount levels. 
Key Queries
Total Sales & Profit
SELECT SUM(sales), SUM(profit) FROM orders;
Profit by Category
SELECT category, SUM(profit) FROM orders GROUP BY category;
Loss Analysis
SELECT category, COUNT(*), SUM(profit)
FROM orders
WHERE profit < 0
GROUP BY category;
Recommendations
Limit high discounts on expensive items (Furniture, Technology)
Review pricing strategy for frequently discounted Office Supplies
Implement discount thresholds to reduce loss-making transactions

While Furniture contributes the highest total losses and Office Supplies accounts for the most frequent loss-making transactions, Technology exhibits the highest loss per transaction, indicating higher severity when losses occur. This suggests that pricing or discounting strategies in Technology, though less frequent, carry higher financial risk per sale.
