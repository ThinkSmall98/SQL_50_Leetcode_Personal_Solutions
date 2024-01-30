-- Write your PostgreSQL query statement below
WITH User1Friends AS (
    SELECT
        CASE WHEN user2_id = 1 THEN user1_id
            WHEN user1_id = 1 THEN user2_id
        END AS user_id
    FROM Friendship
)
SELECT
    DISTINCT L.page_id AS recommended_page
FROM User1Friends F
JOIN Likes L
    ON F.user_id = L.user_id
EXCEPT 
SELECT 
    page_id
FROM Likes
WHERE user_id = 1;
