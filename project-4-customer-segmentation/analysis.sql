-- Customer Segmentation Analysis using SQL
-- Project: Online Retail Customer Segmentation
-- Tool: MySQL

USE onlineretail_db;

-- 1. Preview raw dataset
SELECT *
FROM online_retail
LIMIT 10;

-- 2. Check total rows in raw dataset
SELECT COUNT(*) AS total_rows
FROM online_retail;

-- 3. Check basic dataset structure
SELECT 
    COUNT(DISTINCT `Customer ID`) AS unique_customers,
    COUNT(DISTINCT Invoice) AS unique_invoices,
    MIN(InvoiceDate) AS first_date,
    MAX(InvoiceDate) AS last_date
FROM online_retail;

-- 4. Check missing Customer ID rows
SELECT COUNT(*) AS missing_customer_rows
FROM online_retail
WHERE `Customer ID` IS NULL OR `Customer ID` = '';

-- 5. Create clean table by removing rows with missing Customer ID
CREATE TABLE online_retail_clean AS
SELECT *
FROM online_retail
WHERE `Customer ID` IS NOT NULL
AND `Customer ID` != '';

-- 6. Check negative quantities
SELECT *
FROM online_retail_clean
WHERE Quantity < 0;

-- 7. Remove negative quantities
CREATE TABLE online_retail_clean2 AS
SELECT *
FROM online_retail_clean
WHERE Quantity > 0;

-- 8. Check zero or negative prices
SELECT *
FROM online_retail_clean2
WHERE Price <= 0;

-- 9. Create final cleaned dataset
CREATE TABLE online_retail_final AS
SELECT *
FROM online_retail_clean2
WHERE Price > 0;

-- 10. Check final clean dataset row count
SELECT COUNT(*) AS clean_total_rows
FROM online_retail_final;

-- 11. Preview revenue calculation
SELECT 
    `Customer ID`,
    Invoice,
    Quantity,
    Price,
    Quantity * Price AS Revenue
FROM online_retail_final
LIMIT 10;

-- 12. Customer-level summary
SELECT 
    `Customer ID`,
    COUNT(DISTINCT Invoice) AS total_orders,
    SUM(Quantity * Price) AS total_spent,
    AVG(Quantity * Price) AS avg_order_value,
    MAX(InvoiceDate) AS last_purchase_date
FROM online_retail_final
GROUP BY `Customer ID`;

-- 13. Create customer RFM table
CREATE TABLE customer_rfm AS
SELECT 
    `Customer ID`,
    COUNT(DISTINCT Invoice) AS total_orders,
    SUM(Quantity * Price) AS total_spent,
    MAX(InvoiceDate) AS last_purchase_date,
    DATEDIFF(
        (SELECT MAX(InvoiceDate) FROM online_retail_final),
        MAX(InvoiceDate)
    ) AS recency_days
FROM online_retail_final
GROUP BY `Customer ID`;

-- 14. Preview RFM table
SELECT *
FROM customer_rfm
LIMIT 10;

-- 15. Check spending distribution
SELECT 
    MIN(total_spent) AS min_spent,
    MAX(total_spent) AS max_spent,
    AVG(total_spent) AS avg_spent
FROM customer_rfm;

-- 16. Check order frequency distribution
SELECT 
    MIN(total_orders) AS min_orders,
    MAX(total_orders) AS max_orders,
    AVG(total_orders) AS avg_orders
FROM customer_rfm;

-- 17. Create RFM scores using quartiles
CREATE TABLE customer_rfm_scores AS
SELECT 
    `Customer ID`,
    total_orders,
    total_spent,
    recency_days,
    NTILE(4) OVER (ORDER BY total_spent DESC) AS monetary_score,
    NTILE(4) OVER (ORDER BY total_orders DESC) AS frequency_score,
    NTILE(4) OVER (ORDER BY recency_days ASC) AS recency_score
FROM customer_rfm;

-- 18. Preview RFM scores
SELECT *
FROM customer_rfm_scores
LIMIT 10;

-- 19. Create final customer segments
CREATE TABLE customer_segments_final AS
SELECT 
    *,
    CASE
        WHEN monetary_score = 1 AND frequency_score = 1 THEN 'High Value'
        WHEN frequency_score <= 2 THEN 'Frequent Buyers'
        WHEN recency_score = 4 THEN 'At Risk'
        ELSE 'Regular Customers'
    END AS segment
FROM customer_rfm_scores;

-- 20. Final customer segment distribution
SELECT 
    segment,
    COUNT(*) AS num_customers,
    ROUND(AVG(total_spent), 2) AS avg_spent
FROM customer_segments_final
GROUP BY segment
ORDER BY avg_spent DESC;

-- 21. Total spending by segment
SELECT 
    segment,
    COUNT(*) AS num_customers,
    ROUND(SUM(total_spent), 2) AS total_segment_revenue,
    ROUND(AVG(total_spent), 2) AS avg_customer_spend
FROM customer_segments_final
GROUP BY segment
ORDER BY total_segment_revenue DESC;

-- 22. Top 10 highest spending customers
SELECT *
FROM customer_segments_final
ORDER BY total_spent DESC
LIMIT 10;

-- 23. At-risk customers
SELECT *
FROM customer_segments_final
WHERE segment = 'At Risk'
ORDER BY recency_days DESC;

-- 24. Frequent buyers with upsell potential
SELECT *
FROM customer_segments_final
WHERE segment = 'Frequent Buyers'
ORDER BY total_orders DESC, total_spent DESC;

-- 25. High-value customers
SELECT *
FROM customer_segments_final
WHERE segment = 'High Value'
ORDER BY total_spent DESC;
