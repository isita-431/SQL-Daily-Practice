SELECT c1.name as Customers 
FROM Customers c1
LEFT JOIN Orders ON c1.id = Orders.customerId
WHERE Orders.id IS NULL;
