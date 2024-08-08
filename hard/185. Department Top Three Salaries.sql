WITH RankedSalaries AS (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary,
        dense_rank() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS r
    FROM 
        Employee e
    JOIN 
        Department d 
    ON 
        e.departmentId = d.id
)

SELECT 
    Department, 
    Employee, 
    Salary
FROM 
    RankedSalaries
WHERE 
    r <= 3;
