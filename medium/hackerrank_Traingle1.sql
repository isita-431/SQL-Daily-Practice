delimiter $$
create procedure P (i int) 
begin while i>=1 do 
select repeat ('* ', i);
set i=i-1; 
end while;
end;
$$
call P (20);