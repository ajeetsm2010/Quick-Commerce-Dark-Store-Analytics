-- ==========================================
-- Data Validation Queries
-- Quick Commerce Dark Store Operations Analytics
-- ==========================================

-- 1. Check for NULL Order IDs
SELECT *
FROM Orders
WHERE order_id IS NULL;

-- 2. Check Duplicate Order IDs
SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM Orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 3. Orders with Negative Amount
SELECT *
FROM Orders
WHERE total_amount < 0;

-- 4. Invalid Delivery Time
SELECT *
FROM Orders
WHERE delivery_time_minutes < 0;

-- 5. Missing Rider IDs
SELECT *
FROM Orders
WHERE rider_id IS NULL;

-- 6. Missing Store IDs
SELECT *
FROM Orders
WHERE store_id IS NULL;

-- 7. Invalid Payment Modes
SELECT DISTINCT payment_mode
FROM Orders
WHERE payment_mode NOT IN
('UPI','Cash','Credit Card','Debit Card','Wallet');

-- 8. Invalid Order Status
SELECT DISTINCT order_status
FROM Orders
WHERE order_status NOT IN
('Delivered','Cancelled','Returned');

-- 9. Products with Negative Price
SELECT *
FROM Products
WHERE unit_price < 0;

-- 10. Negative Inventory Stock
SELECT *
FROM Inventory
WHERE system_stock < 0
   OR physical_stock < 0
   OR reserved_stock < 0
   OR damaged_stock < 0;

-- 11. Duplicate Product IDs
SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM Products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- 12. Inventory Records Without Matching Product
SELECT i.*
FROM Inventory i
LEFT JOIN Products p
ON i.product_id = p.product_id
WHERE p.product_id IS NULL;
