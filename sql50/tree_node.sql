-- CASE statement for Root, Inner, Leaf
SELECT 
    id,
    CASE
        WHEN tree.id = (SELECT id FROM Tree WHERE p_id IS NULL)
            THEN 'Root'
        WHEN tree.id IN (SELECT p_id FROM Tree)
            THEN 'Inner'
        ELSE 'Leaf'
    END AS Type
FROM Tree
ORDER BY id;
