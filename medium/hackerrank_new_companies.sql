select c.company_code, c.founder, count(distinct(E.lead_manager_code)) as total_number_of_lead_managers, count(distinct(E.senior_manager_code)) as total_number_of_senior_manager, 
count(distinct(E.manager_code))as total_number_of_managers, count(distinct(E.employee_code))as total_number_of_employee_code 
from company as c join Employee as E on c.company_code= E.company_code 
group by company_code,founder order by company_code;