-- Write your PostgreSQL query statement below
SELECT 
    W2.id As Id
FROM Weather W1, 
        Weather W2 
WHERE EXTRACT('day' FROM W2.recordDate) - EXTRACT('day' FROM W1.recordDate) = 1
    AND W1.temperature < W2.temperature;
