-- Write your PostgreSQL query statement below
SELECT 
    C.customer_id,
    C.customer_name
FROM Customers C
INNER JOIN Orders O
    ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.customer_name
HAVING SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) > 0 
    AND SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0
ORDER BY C.customer_id;
