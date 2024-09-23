with cte as (select order_id, customer_id, order_type, count(*) - sum(order_type) as diff from Orders group by customer_id )

select o.order_id, o.customer_id , o.order_type from Orders o join cte on o.customer_id = cte.customer_id where cte.diff=0
union
select o.order_id, o.customer_id , o.order_type from Orders o join cte on o.customer_id = cte.customer_id where cte.diff>0 and o.order_type =0
