SELECT 
    C.customer_id,
    C.name
FROM Customers C
LEFT JOIN Orders O
    ON C.customer_id = O.customer_id
INNER JOIN Product P
    ON P.product_id = O.product_id
        AND O.order_date BETWEEN '2020-06-01' AND '2020-07-31'
GROUP BY 
    C.customer_id, C.name
HAVING SUM(CASE WHEN 
                EXTRACT('month' FROM O.order_date) = 6 THEN O.quantity * P.price 
                ELSE 0 END) >= 100 AND 
        SUM(CASE WHEN 
                EXTRACT('month' FROM O.order_date) = 7 THEN O.quantity * P.price 
                ELSE 0 END) >= 100;
