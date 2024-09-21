WITH AllCategories AS (
  SELECT 'Low Salary' AS category
  UNION ALL
  SELECT 'Average Salary'
  UNION ALL
  SELECT 'High Salary'
)

SELECT 
  ac.category,
  COUNT(CASE 
    WHEN a.income < 20000 AND ac.category = 'Low Salary' THEN 1
    WHEN a.income BETWEEN 20000 AND 50000 AND ac.category = 'Average Salary' THEN 1
    WHEN a.income > 50000 AND ac.category = 'High Salary' THEN 1
    ELSE NULL
  END) AS accounts_count
FROM 
  AllCategories ac
LEFT JOIN 
  Accounts a ON (ac.category = 
    CASE 
      WHEN a.income < 20000 THEN 'Low Salary'
      WHEN a.income BETWEEN 20000 AND 50000 THEN 'Average Salary'
      WHEN a.income > 50000 THEN 'High Salary'
    END
  )
GROUP BY 
  ac.category
ORDER BY 
  ac.category;
