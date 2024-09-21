WITH TA AS (
    SELECT 
        customer_id, 
        visited_on, 
        SUM(amount) AS amt,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS row_num
    FROM Customer
    GROUP BY  visited_on
),
TA2 AS (
    SELECT 
        visited_on, 
        SUM(amt) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling, 
        row_num
    FROM TA
)
SELECT 
    visited_on, 
    rolling AS amount, 
    ROUND(rolling / 7, 2) AS average_amount
FROM TA2
WHERE row_num >= 7
ORDER BY visited_on;


