select u.user_id, count(distinct u.follower_id) as followers_count 
from Followers u
group by u.user_id 
order by user_id asc;