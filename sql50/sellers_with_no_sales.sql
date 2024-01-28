-- no sales in 2020
WITH Sale2020 AS (
    SELECT 
        S.seller_name,
        S.seller_id
    FROM Seller S
    LEFT JOIN Orders O
        ON S.seller_id = O.seller_id
    WHERE EXTRACT('year' FROM O.sale_date) = 2020
)
SELECT 
    S.seller_name
FROM Seller S
LEFT JOIN Sale2020 SA
    ON SA.seller_id = S.seller_id
WHERE SA.seller_id IS NULL
ORDER BY S.seller_name;
