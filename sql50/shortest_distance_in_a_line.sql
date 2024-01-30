-- SELF JOIN & MIN function
SELECT 
    MIN(ABS(P1.x - P2.x)) AS shortest
FROM Point P1
JOIN Point P2
    ON P1.x != P2.x;
