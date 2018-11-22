Insert into ( Select a.location_id, a.city, a.country_id
              From locations a
              Join countries b
              on a.country_id=b.country_id
              join regions c
              Using (region_id)
              where region_name='Europe')
Values (3300, 'Cardiff', 'UK');

Insert into ( Select a.location_id, a.city, a.country_id
              From locations a
              Where country_id IN
                ( Select country_id
                From countries b
                join regions c
                on b.region_id=c.region_id
                where region_name='Europe')
              WITH CHECK OPTION)
Values (3600, 'Brussels', 'BE');

Create table Test_emp as
Select *
from employees;

Alter table Test_emp
add (department_name varchar2 (25));

Update test_emp a
set department_name = (Select b.department_name from departments b
                      where a.department_id=b.department_id);

Delete from test_emp
where employee_id in (Select employee_id from job_history
                     where employee_id=test_emp.employee_id);

