-- Write your PostgreSQL query statement below
SELECT 
    CASE
        WHEN from_id > to_id THEN to_id
        ELSE from_id
    END AS person1,
    CASE
        WHEN from_id > to_id THEN from_id
        ELSE to_id
    END AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM Calls
GROUP BY person1, person2;
-- SELECT 
--     LEAST(from_id, to_id) AS person1,
--     GREATEST(from_id, to_id) AS person2,
--     COUNT(*) AS call_count,
--     SUM(duration) AS total_duration
-- FROM Calls
-- GROUP BY LEAST(from_id, to_id), 
--         GREATEST(from_id, to_id)
-- HAVING LEAST(from_id, to_id) < GREATEST(from_id, to_id);
