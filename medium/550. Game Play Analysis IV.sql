SELECT 
  ROUND(
    SUM(
      CASE 
        WHEN DATE_ADD(temp.min_date, INTERVAL 1 DAY) = a.event_date THEN 1 
        ELSE 0 
      END
    ) / COUNT(DISTINCT temp.player_id), 
    2
  ) AS fraction
FROM 
  (SELECT player_id, MIN(event_date) AS min_date FROM activity GROUP BY player_id) AS temp
JOIN 
  activity a
ON 
  temp.player_id = a.player_id;
