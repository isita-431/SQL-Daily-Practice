select if(e.name is null , null , e.name)  as name from Employee e cross join Employee ei where e.id = ei.managerId
group by ei.managerId
having count(distinct ei.name)>=5 OR
  COUNT(ei.name) = 0;
