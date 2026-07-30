-- ==========================================
-- Business Queries
-- Quick Commerce Dark Store Operations Analytics
-- ==========================================

-- 1. Total Revenue
SELECT ROUND(SUM(total_amount),2) AS total_revenue
FROM Orders;

-- 2. Revenue by City
SELECT
    s.city,
    ROUND(SUM(o.total_amount),2) AS revenue
FROM Orders o
JOIN Stores s
ON o.store_id = s.store_id
GROUP BY s.city
ORDER BY revenue DESC;

-- 3. Revenue by Product Category
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 4. Top 10 Products by Revenue
SELECT
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

-- 5. Orders by Payment Mode
SELECT
    payment_mode,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY payment_mode
ORDER BY total_orders DESC;

-- 6. Order Status Summary
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;

-- 7. Average Delivery Time by City
SELECT
    s.city,
    ROUND(AVG(o.delivery_time_minutes),2) AS avg_delivery_time
FROM Orders o
JOIN Stores s
ON o.store_id = s.store_id
GROUP BY s.city
ORDER BY avg_delivery_time;

-- 8. Rider-wise Orders
SELECT
    r.rider_name,
    COUNT(*) AS total_orders
FROM Orders o
JOIN Riders r
ON o.rider_id = r.rider_id
GROUP BY r.rider_name
ORDER BY total_orders DESC;

-- 9. Top Performing Stores
SELECT
    s.store_name,
    ROUND(SUM(o.total_amount),2) AS revenue
FROM Orders o
JOIN Stores s
ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY revenue DESC;

-- 10. Monthly Revenue Trend
SELECT
    strftime('%Y-%m', order_date) AS month,
    ROUND(SUM(total_amount),2) AS revenue
FROM Orders
GROUP BY month
ORDER BY month;
