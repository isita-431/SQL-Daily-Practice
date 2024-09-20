select product_name , sum(unit) as unit from 
Products left join Orders on Products.product_id = Orders.product_id 
where date(order_date) > date('2020-01-31') and date(order_date) < date('2020-03-1')
group by product_name
having sum(unit)>=100;