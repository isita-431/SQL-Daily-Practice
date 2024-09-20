SELECT teacher_id, COUNT(distinct subject_id) AS cnt 
FROM Teacher t 
GROUP BY t.teacher_id;