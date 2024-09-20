select user_id , concat(ucase(substr(name,1,1)),lcase(substr(name,2,length(name)))) as name from Users
order by user_id;