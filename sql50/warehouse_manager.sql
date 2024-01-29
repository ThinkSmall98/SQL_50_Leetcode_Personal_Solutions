-- Write your PostgreSQL query statement below
SELECT 
    W.name AS warehouse_name,
    SUM((P.Width * P.Length * P.Height) * W.units) AS volume
FROM Warehouse W
LEFT JOIN Products P
    ON W.product_id = P.product_id
GROUP BY W.name
ORDER BY W.name;
