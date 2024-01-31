-- IDs of transactions with MAX(amount) on respetive day. Return multiple on same day
SELECT 
    transaction_id
FROM Transactions
WHERE (day::date, amount) IN 
    (SELECT 
        day::date AS day,
        MAX(amount)
    FROM Transactions
    GROUP BY day
    )
ORDER BY transaction_id;
