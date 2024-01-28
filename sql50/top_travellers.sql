-- Write your PostgreSQL query statement below
SELECT 
    U.name,
    CASE WHEN 
        SUM(R.distance) IS NOT NULL THEN SUM(R.distance)
        ELSE 0
    END AS travelled_distance
FROM Users U
LEFT JOIN Rides R
    ON R.user_id = U.id
GROUP BY U.id, U.name
ORDER BY travelled_distance DESC, U.name ASC;
