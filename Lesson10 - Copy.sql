Select sum(salary) as total_salary
     ,min(salary) as minimum_salary
     ,max(salary) as maximum_salary
     ,avg(salary) as average_salary
     ,count(employee_id) as count_salary
     ,count(distinct department_id) as distinct_departmentID
     ,count(department_id) as departmentID
     ,count (*) as count_all -- count all
From employees;

select count(distinct job_id) as job_id1
      ,count(job_id)
      ,sum(distinct salary) as salary1
      ,sum(salary)  as salary2
      ,min(hire_date)
      ,max(hire_date)
from employees;
--where job_id='ST_CLERK';

Select avg(commission_pct) as avg1--nu include null values
       ,avg(nvl(commission_pct,0)) as avg2_with_null_values
From employees;

Select department_id, round(avg(salary)),min(hire_date),count(employee_id)
From employees
where department_id is not null
Group By department_id
Order by department_id;

Select department_id, job_id, round(avg(salary)),count(employee_id)
From employees
Group By department_id,job_id
Order by department_id;

Select nvl(department_id,10), round(avg(salary))
From employees
Group By nvl(department_id,10) --am sumat si grupat departamentul null cu departmentul 10
Order by nvl(department_id,10);

Select department_id, job_id, count(last_name)
From employees
Group by department_id,job_id;

Select nvl(department_id,10), job_id, round(avg(salary),2)
From employees
Group by nvl(department_id,10),job_id
Order by 1;


Select department_id, job_id, manager_id
      ,round(avg(salary),2) avg_salary
      ,min(hire_date) min_hire_date
      ,max(hire_date) max_hire_date
From employees
where department_id between 50 and 100
Group by department_id,job_id,manager_id
Order by 1;


Select department_id, job_id
      ,round(avg(salary),2) avg_salary
From employees
Where department_id between 50 and 100
Group by department_id,job_id
Having avg(salary)>10000
Order by 1;

Select max(marks) Highest , min(marks) Lowest, round(avg(marks)) Average
From ad_exam_results;

Select exam_id, max(marks) Highest , min(marks) Lowest, round(avg(marks)) Average
From ad_exam_results
Group by exam_id
Order by exam_id;

Select course_id, count(student_id)
From ad_student_course_details
Group by course_id
Order by course_id;

Select exam_id, course_id, round(avg(marks)) Average
From ad_exam_results
Group by exam_id, course_id
Having round(avg(marks))>85
Order by 1;

Select max(salary)-min(salary) as Difference
From ad_faculty_details;

Select max(avg(marks))
From ad_exam_results
Group by course_id;

Select course_id, min(marks)
From ad_exam_results
where course_id in ('190','191','192')
Group by course_id
Having min(marks) >75
Order by 1;

Select *
From employees;

Select to_char(hire_date,'mm.yyyy')as Hire_date, max(salary) as "Maximum Salary"
From employees
where phone_number like '650%'
Group by to_char(hire_date,'mm.yyyy')
Order by 2 desc;

Select initcap(substr(job_id,1,2))|| lower(substr(job_id,3,8)) as job_id, count(employee_id)
From employees
Group by job_id
Order by 1;

Select to_char(hire_date,'mm.yyyy') as Month_date, count(employee_id) as "Nr angajati"
From employees
Group by to_char(hire_date,'mm.yyyy')
Order by to_date(month_date,'mm.yyyy') desc;

Select to_char(hire_date,'mm.yyyy') as Month_date, count(employee_id) as Nr_angajati
From employees
Group by to_char(hire_date,'mm.yyyy')
Having count(employee_id)>1
Order by to_date(month_date,'mm.yyyy');

Select manager_id, count(employee_id) as nr_angajati
From employees
Group by manager_id
Having count(employee_id)>1
Order by 1 asc;

Select NVL(to_char(commission_pct),'persoane fara comision'), count(employee_id)
from employees
Group by NVL(to_char(commission_pct),'persoane fara comision');

6-a)Afisati employee_id, job_id si cite luni a lucrat persoana respectiva in acea functie.
Ordonati datele la alegere astfel incit data angajatul are mai multe inregistrari sa le vizualizati impreuna. 
6- b)Verificati dataca sunt persoane care si-au schimbat jobul cel putin de 2 ori.

Select employee_id, job_id, round(months_between(sysdate,hire_date)) as Months_worked
,Case when round(months_between(sysdate,hire_date))<40 then 'putin timp lucrat'
     when round(months_between(sysdate,hire_date)) between 40 and 60 then 'moderat timp lucrat'
     when round(months_between(sysdate,hire_date)) between 60 and 80 then 'mult timp lucrat'
     when round(months_between(sysdate,hire_date)) >80  then 'Foarte mult timp lucrat'
     else 'error' end "Descriere timp lucrat"
From employees
Order by 4;

Select employee_id, count(job_id)
from job_history
Group by employee_id
Having count(job_id)>1;

7) scrieti un select ca sa afiseje toata informatia acestor persoane.

Select *
From employees
Where employee_id in ('101','176','200');

Select *
From employees;