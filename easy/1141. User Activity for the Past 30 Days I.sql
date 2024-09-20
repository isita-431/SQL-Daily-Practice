select activity_date as day, count(distinct user_id) as active_users from Activity group by activity_date having date(activity_date) > date('2019-06-27') and date(activity_date) < date('2019-07-28')