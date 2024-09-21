WITH sub as 
 (select product_id,new_price  as price,change_date,
ROW_NUMBER() over (partition by product_id order by change_date desc)  rn
from Products where change_date<='2019-08-16' )

select product_id, price from sub where rn = 1

union

select distinct(product_id),10 as price from Products where product_id not in 
(select product_id from sub where rn = 1)