-- Students that didn't have highest/lower score
-- Find highest/lowest scores first
WITH MinMaxScore AS (
    SELECT
        E.exam_id,
        S.student_id,
        S.student_name,
        E.Score,
        RANK() OVER(
            PARTITION BY exam_id
            ORDER BY score
        ) as lowest_score,
        RANK() OVER(
            PARTITION BY exam_id
            ORDER BY score DESC
        ) as highest_score
    FROM Exam E
    INNER JOIN Student S
        On E.student_id = S.student_id
)
SELECT
    DISTINCT student_id,
    student_name
FROM MinMaxScore 
WHERE student_id NOT IN 
    (SELECT 
        student_id 
    FROM MinMaxScore
    WHERE highest_score = 1 OR lowest_score = 1
    )
ORDER BY student_id;
