WITH RedCompany AS (
    SELECT 
        O.sales_id
    FROM Orders O
    LEFT JOIN Company C
        ON C.com_id = O.com_id
    WHERE C.name = 'RED'
)
SELECT 
    S.name
FROM SalesPerson S
WHERE S.sales_id NOT IN 
    (SELECT sales_id FROM RedCompany);
