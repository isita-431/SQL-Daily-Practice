SELECT name , bonus
FROM Employee 
left JOIN bonus on Employee.empId = bonus.empId
where (Bonus.bonus<1000 or bonus is null);
