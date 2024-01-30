SELECT 
    DISTINCT C.title
FROM Content C
INNER JOIN TVProgram T
    ON C.content_id = T.content_id
    AND T.program_date BETWEEN '2020-06-01' AND '2020-06-30'
    AND C.Kids_content = 'Y'
    AND C.content_type = 'Movies';
