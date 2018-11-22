drop view Employees_Info_VW;

Create or Replace view Employees_Info_VW as 
Select a.employee_id as emp_id
      ,a.last_name ||' '|| a.first_name as emp_full_name
      ,b.employee_id as manager_id
      ,b.last_name ||' '|| b.first_name as manager_full_name
      ,a.email
      ,a.salary
      ,a.hire_date
      ,a.job_id
      ,c.department_name
      ,d.state_province ||','||d.city ||',' || d.street_address||','||d.postal_code emp_address
from employees a
left join employees b
on a.manager_id=b.employee_id
left join departments c
on a.department_id = c.department_id
left join locations d
on c.location_id=d.location_id;


Select * 
from Employees_Info_VW;

Select * 
from locations;

Create or Replace view Manager_tree as
Select b.employee_id as manager_id
      ,b.last_name ||' '|| b.first_name as manager_full_name
      ,Count(a.employee_id) as amount_of_emp
 from employees a
left join employees b
on a.manager_id=b.employee_id
group by  b.employee_id 
      ,b.last_name ||' '|| b.first_name;

select * 
from user_views;



Select a.*
      ,b.amount_of_emp
from Employees_Info_VW a 
left join Manager_tree b
on a.manager_id=b.manager_id;


Create  or replace view Test_employees_VW as 
Select employee_id
       ,job_id
       ,salary
from employees;

Update Test_employees_VW
set salary=10
where job_id in('IT_PROG','FI_ACCOUNT');

Select * 
from Test_employees_VW;

Select * 
from employees;

CREATE VIEW DEPT80 AS
SELECT employee_id, last_name, department_id
FROM employees
where department_id=80
WITH CHECK OPTION CONSTRAINT emp_dept_80; -- nu permite de a efectua modificari in tabel

Select *
from dept80;

UPDATE dept80
SET department_id=50
WHERE LAST_NAME = 'Russell';







