-- Most experienced employee in each project. 
-- Report all employees in case of ties
WITH MostExperienced AS (
    SELECT
        P.project_id,
        E.employee_id,
        RANK() OVER(
            PARTITION BY project_id
            ORDER BY experience_years DESC
        ) AS rank_experience
    FROM Project P
    LEFT JOIN Employee E
        ON P.employee_id = E.employee_id
)
SELECT
    project_id,
    employee_id
FROM MostExperienced
WHERE rank_experience = 1;
