with cte as (select max(salary) as ma, e.departmentId, d.name 
from Employee e join Department d 
on e.departmentId = d.id 
group by e.departmentId)

select d.name as Department, e.name as Employee, d.ma as Salary from Employee e join cte d on e.departmentId = d.departmentId 
where e.salary = d.ma and e.departmentId = d.departmentId