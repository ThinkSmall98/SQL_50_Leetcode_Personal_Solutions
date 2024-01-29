SELECT
    team_id,
    team_name,
    SUM(CASE 
            WHEN (M.host_goals < M.guest_goals AND T.team_id = M.guest_team) 
                OR (M.host_goals > M.guest_goals AND T.team_id = M.host_team) THEN 3
            WHEN (M.host_goals = M.guest_goals AND T.team_id = M.guest_team) 
                OR (M.host_goals = M.guest_goals AND T.team_id = M.host_team) THEN 1
            ELSE 0
        END) AS num_points
FROM Teams T
LEFT JOIN Matches M
    ON T.team_id = M.host_team OR T.team_id = M.guest_team
GROUP BY team_id, team_name
ORDER BY num_points DESC, team_id ASC;
