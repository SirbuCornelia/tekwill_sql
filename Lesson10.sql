Select sum(salary) as total_salary
     ,min(salary) as minimum_salary
     ,max(salary) as maximum_salary
     ,avg(salary) as average_salary
     ,count(employee_id) as count_salary
     ,count(distinct department_id) as distinct_departmentID
     ,count(department_id) as departmentID
From employees;

select count(distinct job_id)
      ,count(job_id)
      ,sum(distinct salary) as salary1
      ,sum(salary)  as salary2
from employees;

