select  CONCAT(YEAR(t.trans_date), '-', LPAD(MONTH(t.trans_date), 2, '0')) as month ,
t.country, count(*) as trans_count, SUM(IF(state = 'approved', 1, 0)) as approved_count,
sum(amount) as trans_total_amount, sum(IF(state = 'approved', t.amount, 0)) as approved_total_amount from Transactions t
group by month , t.country ;