-- IDs of missing subtasks for each task_id
WITH RECURSIVE Subtasks AS (
    SELECT 
        task_id,
        subtasks_count
    FROM Tasks
    UNION ALL
    SELECT
        task_id,
        subtasks_count - 1 AS subtacks_count
    FROM Subtasks
    WHERE subtasks_count > 1
)
SELECT
    S.task_id, 
    S.subtasks_count AS subtask_id
FROM Subtasks S
LEFT JOIN Executed E
    ON S.task_id = E.task_id
        AND S.subtasks_count = E.subtask_id
WHERE E.subtask_id IS NULL;
