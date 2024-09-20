SELECT e.event_day as day, e.emp_id, SUM(e.out_time) - SUM(e.in_time) as total_time
FROM Employees e
GROUP BY e.event_day, e.emp_id;
