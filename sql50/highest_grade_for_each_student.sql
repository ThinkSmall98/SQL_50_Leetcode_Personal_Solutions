WITH RankedGrades AS (
    SELECT 
        student_id,
        course_id,
        grade,
        ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC, student_id ASC, course_id ASC) AS row_num
    FROM Enrollments
)
SELECT
    student_id,
    course_id,
    grade
FROM RankedGrades
WHERE row_num = 1;
