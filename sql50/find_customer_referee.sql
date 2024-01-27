-- Write your PostgreSQL query statement below
SELECT 
    name
FROM Customer c
WHERE referee_id != 2 OR referee_id is NULL; 
/*
don't forget if there are NULL values to include that in WHERE statement!
*/
