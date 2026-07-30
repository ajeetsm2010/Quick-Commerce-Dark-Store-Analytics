import sqlite3
import pandas as pd

# Connect to SQLite Database
conn = sqlite3.connect("../database/quick_commerce.db")

# Query High-Risk Stores
query = """
SELECT
    s.store_name,
    s.city,
    COUNT(o.order_id) AS total_orders,
    ROUND(
        SUM(CASE WHEN o.sla_breach = 1 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(o.order_id),2
    ) AS sla_breach_percent
FROM Orders o
JOIN Stores s
ON o.store_id = s.store_id
GROUP BY s.store_name, s.city
HAVING sla_breach_percent > 40
ORDER BY sla_breach_percent DESC;
"""

df = pd.read_sql(query, conn)

# Export Alert Report
df.to_excel("High_Risk_Dark_Stores_Report.xlsx", index=False)

print("✅ High Risk Dark Store Report Generated Successfully!")

conn.close()
