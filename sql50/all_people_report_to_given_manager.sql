-- Return employee_id that report to head of company. 
-- Indirect relation between managers not exceed 3

-- Triple Join Method
-- SELECT
--     E1.employee_id
-- FROM Employees E1
-- INNER JOIN Employees E2
--     ON E1.manager_id = E2.employee_id
-- INNER JOIN Employees E3
--     On E2.manager_id = E3.employee_id
-- WHERE E3.manager_id = 1
--     AND E1.employee_id != 1;

WITH RECURSIVE subordinates AS (
    SELECT 
        employee_id,
        1 AS depth
    FROM Employees 
    WHERE employee_id != 1 AND manager_id = 1
    UNION ALL
    SELECT 
        e.employee_id,
        s.depth + 1 AS depth
    FROM Employees e 
    INNER JOIN Subordinates s 
        ON s.employee_id = e.manager_id
    WHERE s.depth < 3
) 
SELECT 
employee_id
FROM Subordinates;
