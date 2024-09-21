select t.transaction_date ,
 SUM(CASE 
        WHEN t.amount % 2 != 0 THEN t.amount 
        ELSE 0 
      END) AS odd_sum,
  SUM(CASE 
        WHEN t.amount % 2 = 0 THEN t.amount 
        ELSE 0 
      END) AS even_sum
from transactions t group by t.transaction_date
order by t.transaction_date asc;