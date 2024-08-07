WITH cte AS (
    SELECT 
        Trips.request_at, 
        COUNT(*) AS c 
    FROM 
        Trips 
    JOIN 
        Users AS ClientUsers
    ON 
        Trips.client_id = ClientUsers.users_id 
    JOIN 
        Users AS DriverUsers
    ON 
        Trips.driver_id = DriverUsers.users_id
    WHERE 
        ClientUsers.Banned = 'No' 
        AND DriverUsers.Banned = 'No'
        AND Trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY 
        Trips.request_at
),
cte1 AS (
    SELECT 
        Trips.request_at, 
        COUNT(*) AS c1 
    FROM 
        Trips 
    JOIN 
        Users AS ClientUsers
    ON 
        Trips.client_id = ClientUsers.users_id 
    JOIN 
        Users AS DriverUsers
    ON 
        Trips.driver_id = DriverUsers.users_id
    WHERE 
        ClientUsers.Banned = 'No' 
        AND DriverUsers.Banned = 'No'
        AND (Trips.status = 'cancelled_by_driver' OR Trips.status = 'cancelled_by_client')
        AND Trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY 
        Trips.request_at
)

SELECT 
    cte.request_at AS Day, 
    IFNULL(ROUND(cte1.c1 / cte.c, 2), 0) AS 'Cancellation Rate'
FROM 
    cte
LEFT JOIN 
    cte1 
ON 
    cte.request_at = cte1.request_at;