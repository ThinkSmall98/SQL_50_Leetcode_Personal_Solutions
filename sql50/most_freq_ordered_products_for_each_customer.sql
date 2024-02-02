-- -- Most freq. order products(s) for each customer
WITH MostOrdered AS (
    SELECT 
        O.customer_id,
        O.product_id,
        P.product_name,
        RANK() OVER(
            PARTITION BY O.customer_id
            ORDER BY COUNT(O.product_id) DESC
        ) AS rank_product
    FROM Orders O
    INNER JOIN Products P
        ON P.product_id = O.product_id
    GROUP BY O.customer_id, O.product_id, P.product_name
)
SELECT 
    customer_id,
    product_id,
    product_name
FROM MostOrdered
WHERE rank_product = 1;

