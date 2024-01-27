SELECT 
    DISTINCT author_id as id -- need to put DISTINCT because there can be duplicates
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
