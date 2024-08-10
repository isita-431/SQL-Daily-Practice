select a.product_id, a.year as first_year, s.quantity, s.price
from (select s.product_id, min(year) as year from Sales s left join 
Product p on s.product_id = p.product_id 
group by s.product_id ) as a join Sales s on 
s.product_id = a.product_id and s.year = a.year