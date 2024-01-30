-- FULL join & coalesce two cols together
SELECT 
    COALESCE(E.employee_id, S.employee_id) AS employee_id
FROM Employees E
FULL JOIN Salaries S
    ON E.employee_id = S.employee_id
WHERE E.name IS NULL 
    OR S.salary IS NULL
ORDER BY employee_id ASC;
