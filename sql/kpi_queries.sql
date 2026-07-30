-- ==========================================
-- KPI Queries
-- Quick Commerce Dark Store Operations Analytics
-- ==========================================

-- 1. Total Revenue
SELECT ROUND(SUM(total_amount),2) AS Total_Revenue
FROM Orders;

-- 2. Total Orders
SELECT COUNT(order_id) AS Total_Orders
FROM Orders;

-- 3. Total Customers
SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM Orders;

-- 4. Average Order Value (AOV)
SELECT ROUND(AVG(total_amount),2) AS Average_Order_Value
FROM Orders;

-- 5. Average Delivery Time
SELECT ROUND(AVG(delivery_time_minutes),2) AS Average_Delivery_Time
FROM Orders;

-- 6. SLA Breach Percentage
SELECT
ROUND(
(SUM(CASE WHEN sla_breach = 1 THEN 1 ELSE 0 END) * 100.0)
/COUNT(*),2
) AS SLA_Breach_Percentage
FROM Orders;

-- 7. Total SKUs
SELECT COUNT(product_id) AS Total_SKUs
FROM Products;

-- 8. Average System Stock
SELECT ROUND(AVG(system_stock),2) AS Avg_System_Stock
FROM Inventory;

-- 9. Average Physical Stock
SELECT ROUND(AVG(physical_stock),2) AS Avg_Physical_Stock
FROM Inventory;

-- 10. Average Reserved Stock
SELECT ROUND(AVG(reserved_stock),2) AS Avg_Reserved_Stock
FROM Inventory;

-- 11. Average Damaged Stock
SELECT ROUND(AVG(damaged_stock),2) AS Avg_Damaged_Stock
FROM Inventory;
