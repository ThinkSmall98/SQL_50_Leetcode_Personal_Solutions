-- Use window function & group by at the end
SELECT
    employee_id,
    COUNT(employee_id) OVER(PARTITION BY team_id) AS team_size
FROM Employee
GROUP BY employee_id, team_id;
