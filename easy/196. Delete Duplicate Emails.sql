with cte as (
select email, min(id) as min_id, count(id) as multiple_email
from person
group by email
)
delete from person 
from cte 
where multiple_email > 1
and person.email = cte.email
and id > min_id