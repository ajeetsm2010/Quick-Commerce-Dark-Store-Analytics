-- ==========================================
-- Quick Commerce Dark Store Operations Analytics
-- Database Schema
-- ==========================================

CREATE TABLE Stores (
    store_id INTEGER PRIMARY KEY,
    store_name TEXT,
    city TEXT,
    manager_name TEXT
);

CREATE TABLE Riders (
    rider_id INTEGER PRIMARY KEY,
    rider_name TEXT,
    city TEXT,
    shift TEXT
);

CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    unit_price REAL
);

CREATE TABLE Inventory (
    inventory_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    store_id INTEGER,
    system_stock INTEGER,
    physical_stock INTEGER,
    reserved_stock INTEGER,
    damaged_stock INTEGER,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    store_id INTEGER,
    rider_id INTEGER,
    order_date DATE,
    payment_mode TEXT,
    order_status TEXT,
    delivery_time_minutes INTEGER,
    sla_breach BOOLEAN,
    total_amount REAL,
    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (rider_id) REFERENCES Riders(rider_id)
);

CREATE TABLE Order_Items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price REAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
