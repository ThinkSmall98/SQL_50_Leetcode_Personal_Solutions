-- CROSS JOIN
SELECT 
    DISTINCT L1.account_id
FROM LogInfo L1
INNER JOIN LogInfo L2
    ON L1.account_id = L2.account_id
     AND L1.ip_address != L2.ip_address 
    AND L1.login <= L2.logout AND L2.login <= L1.logout -- should be equal to bc cannot login & out at the same exact time
