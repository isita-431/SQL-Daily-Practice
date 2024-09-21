with cte as
(select pid, TIV_2015, TIV_2016, count(concat(lat, lon)) over (partition by concat(lat, lon)) as cnt1, count(TIV_2015) over(partition by tiv_2015) as cnt
from insurance)

select round(sum(TIV_2016),2) as TIV_2016 from cte where cnt1=1 and cnt!=1