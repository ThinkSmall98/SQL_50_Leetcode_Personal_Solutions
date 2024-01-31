-- Most recent 3 orders per user
WITH Top3 AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        RANK() OVER(
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS rank_order
    FROM Orders O
)
SELECT 
    C.name AS customer_name,
    C.customer_id,
    T.order_id,
    T.order_date
FROM Customers C
    JOIN Top3 T
        ON T.customer_id = C.customer_id
WHERE rank_order <= 3
ORDER BY C.name ASC,
        C.customer_id ASC,
        T.order_date DESC;
