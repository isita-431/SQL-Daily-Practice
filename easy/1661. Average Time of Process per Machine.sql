SELECT machine_id, 
       ROUND(SUM(CASE WHEN activity_type = 'start' THEN -timestamp ELSE timestamp END) 
       / SUM(CASE WHEN activity_type = 'start' THEN 1 ELSE 0 END), 3) AS processing_time 
FROM Activity
GROUP BY machine_id;
