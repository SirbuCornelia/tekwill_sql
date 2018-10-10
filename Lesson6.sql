select round(max(salary)) as maximum
       ,round(min(salary)) as minimum
       ,round(avg(salary)) as average
       ,round(sum(salary)) as Sum
 from employees;

select salary
from employees;

select  job_id
       ,round(max(salary)) as maximum
       ,round(min(salary)) as minimum
       ,round(avg(salary)) as average
       ,round(sum(salary)) as Sum
From employees
Group by job_id
Order by job_id;

select  job_id
       ,count(*)
From employees
Group by job_id
Order by job_id;

select  job_id
       ,count(*)
From employees
where job_id='&job_id'
Group by job_id
Order by job_id;

select  count(distinct manager_id) as "Number of Managers" 
From employees;

select  max(salary)-min(salary) as "Diference" 
From employees;

select  manager_id
       ,min(salary)
From employees
where manager_id is not null
Group by manager_id
Having min(salary)>6000
Order by min(salary) desc;

select  count(*) as total
       ,sum(decode(to_char(hire_date,'YYYY'), 2010,1,0)) "2010"
       ,sum(decode(to_char(hire_date,'YYYY'), 2011,1,0)) "2011"
       ,sum(decode(to_char(hire_date,'YYYY'), 2012,1,0)) "2012"
       ,sum(decode(to_char(hire_date,'YYYY'), 2013,1,0)) "2013"
From employees;

Select job_id Job
       ,sum(decode(department_id,20,salary)) Dept20
       ,sum(decode(department_id,50,salary)) Dept50
       ,sum(decode(department_id,80,salary)) Dept80
       ,sum(decode(department_id,90,salary)) Dept90
       ,sum(salary) Total
from employees
Group by job_id
Order by Job_id;

	
