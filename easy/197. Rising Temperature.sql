select w.id from Weather w join Weather a where 
DATEDIFF(w.recordDate,a.recordDate) = 1 and w.temperature>a.temperature;