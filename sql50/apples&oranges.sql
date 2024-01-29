-- SELF JOIN
SELECT
    S1.sale_date,
    SUM(S1.sold_num - S2.sold_num) AS diff
FROM Sales S1
JOIN Sales S2
    ON S1.sale_date = S2.sale_date
        AND S1.fruit IN ('apples')
        AND S2.fruit IN ('oranges')
GROUP BY S1.sale_date
ORDER BY S1.sale_date;
