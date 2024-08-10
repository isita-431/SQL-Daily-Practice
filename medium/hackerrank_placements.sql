with ct1 as (select f.id as p_id , f.friend_id as f_id , p.salary as p_sal from friends f join packages p on f.id = p.id),
ct2 as (select f.friend_id as f_name , p.salary as f_sal from friends f join packages p on f.friend_id = p.id), ct3 as (select p_id, ct2.f_sal as sal from ct1 join ct2 on ct1.f_id = ct2.f_name 
where ct1.p_sal < ct2.f_sal )
select s.name from students s join ct3 on s.id = ct3.p_id  order by ct3.sal
