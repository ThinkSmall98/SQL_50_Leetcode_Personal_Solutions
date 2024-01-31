-- SUM when player_id = one of the tennis matches. Cast as INT.
SELECT 
    P.player_id,
    P.player_name,
    SUM((P.player_id = C.Wimbledon)::INT) + SUM((P.player_id = C.Fr_open)::INT) +
        SUM((P.player_id = C.US_open)::INT) + SUM((P.player_id = C.Au_open)::INT)
    AS grand_slams_count
FROM Players P
INNER JOIN Championships C
    ON C.Wimbledon = P.player_id OR C.Fr_open = P.player_id 
        OR C.US_open = P.player_id OR C.Au_open = P.player_id
GROUP BY player_id, player_name;
