select user_id, max(time_stamp) as last_stamp from Logins
where date(time_stamp) > date('2019-12-31') and date(time_stamp) < date('2021-01-01') group by user_id order by last_stamp desc;