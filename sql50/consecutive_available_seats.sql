-- Start with cartesian product (Cross join) & ABS to get ones next to each other
SELECT 
    DISTINCT C1.seat_id
FROM Cinema C1
INNER JOIN Cinema C2
    ON ABS(C1.seat_id - C2.seat_id) = 1
        AND C1.free = 1 AND C2.free = 1
ORDER BY C1.seat_id ASC;
