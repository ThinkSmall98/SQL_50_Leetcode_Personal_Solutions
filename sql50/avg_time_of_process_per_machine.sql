SELECT 
    A1.machine_id,
    ROUND(CAST(AVG(A2.timestamp - A1.timestamp) AS numeric) , 3)  AS processing_time
FROM Activity A1
JOIN Activity A2
    ON A2.machine_id = A1.machine_id
    AND A2.process_id = A1.process_id
    AND A2.activity_type = 'end' 
    AND A1.activity_type = 'start' 
GROUP BY A1.machine_id;
