-- Write your PostgreSQL query statement below
SELECT 
    V.customer_id,
    COUNT(*) AS count_no_trans -- have to use COUNT(*) bc of NULLs
FROM Visits V
LEFT JOIN Transactions T
    ON V.visit_id = T.visit_id
WHERE T.visit_id IS NULL
GROUP BY V.customer_id;
