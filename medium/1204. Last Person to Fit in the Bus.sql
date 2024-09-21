select top 1 name person_name
from(
select turn, person_id, person_name name, weight,
sum(weight) over(order by turn) total_w
from queue) a
where total_w <= 1000
order by total_w desc