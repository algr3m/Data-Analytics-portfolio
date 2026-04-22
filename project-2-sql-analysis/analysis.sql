-- Create database
CREATE DATABASE superstore_db;

-- Use database
USE superstore_db;

-- Total Sales & Profit
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders;

-- Profit by Region
SELECT 
    region,
    SUM(profit) AS total_profit
FROM orders
GROUP BY region;

-- Category Performance
SELECT 
    category,
    SUM(sales),
    SUM(profit)
FROM orders
GROUP BY category;

-- Loss Analysis
SELECT 
    category,
    COUNT(*) AS loss_count,
    SUM(profit) AS total_loss
FROM orders
WHERE profit < 0
GROUP BY category;

-- Loss Severity
SELECT 
    category,
    SUM(profit)/COUNT(*) AS avg_loss_per_transaction
FROM orders
WHERE profit < 0
GROUP BY category;

