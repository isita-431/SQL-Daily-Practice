select e.employee_id, e.name, count(*) as reports_count, round(avg(em.age)) as average_age
from Employees e join Employees em on e.employee_id = em.reports_to 
group by e.employee_id
having count(*)>0
order by employee_id