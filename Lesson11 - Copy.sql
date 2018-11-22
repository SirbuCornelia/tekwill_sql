Select * 
From employees
Natural Join jobs;

Select employees.first_name as name1
       ,employees.last_name as name2
       ,jobs.job_title
From employees as T1
Natural Join jobs as T2;

Select  t1.first_name as name1
       ,t1.last_name as name2
       ,t2.job_title
From employees T1
Natural Join jobs T2;  ---am pus alias la tabel ca sa fie mai usor de scris coloanele

Select job_id,first_name, last_name, job_title
From employees
Join jobs Using (job_id);

Select * 
From job_history
Natural Join employees;

Select * 
From job_history
Join employees using (Job_id);

Select * 
From employees
Natural Join jobs
Natural Join departments
where employee_id=102;

Select *
From employees e1
Join departments d1 on (e1.department_id=d1.department_id);

Select *
From employees e1
Join departments d1 using (manager_id)
Join jobs using (job_id);

Select t1.*, t2.job_title
From employees t1
Join jobs t2
on t1.job_id=t2.job_id;

Select t1.first_name|| ' ' || last_name as Full_name
       ,t2.job_title
       ,t2.min_salary
       ,t2.max_salary
       ,t3.department_name
       ,t3.department_id
From employees t1
Join jobs t2
on t1.job_id=t2.job_id
Join departments t3
on t1.department_id=t3.department_id
and t3.department_id=50 --poti sa scrii where sau and si iti da acelasi rezultat
Fetch first 10 rows only;

Select t1.employee_id
       ,t1.first_name || ' ' || t1.last_name as Full_name_Employee
       ,t2.employee_id as manager_id
       ,t2.first_name || ' ' || t2.last_name as Full_Name_Manager
from employees t1
join employees t2
on t1.manager_id=t2.employee_id;

Select *
From job_grades;

Select e.last_name, e.salary, j.grade_level
From employees e
Join job_grades j
on e.salary
between j.lowest_sal and highest_sal;  --nonequijoins examples

insert into job_grades
values ('L',15000,24999)

delete from job_grades
where grade_level  in ('L')

Select a.employee_id
      ,count(a.employee_id)
From employees a
join job_grades b
on a.salary between b.lowest_sal and b.highest_sal 
group by a.employee_id              --pentru a verifica datele dublate in tabel)
having count(a.employee_id)>1;

Select t1.employee_id
       ,t1.first_name || ' ' || t1.last_name as Full_name_Employee
       ,t2.employee_id as manager_id
       ,t2.first_name || ' ' || t2.last_name as Full_Name_Manager
from employees t1
LEFT Outer join employees t2 --permite sa vedem toti angajatii chiar si cei care nu au manager
on t1.manager_id=t2.employee_id;

Select *
from employees a
Left Outer Join departments b   --imi arata toti angajatii
on a.department_id=b.department_id;

Select *
from employees a
RIGHT Outer Join departments b  --imi arata toate departmanetele
on a.department_id=b.department_id;

Select *
from employees a
FULL Outer Join departments b  --imi arata toate departmanetele
on a.department_id=b.department_id;

Select location_id, street_address, city, state_province, country_name
from Locations Natural Join countries;

Select last_name, department_id, department_name
From employees
Join departments using (department_id);

Select e.last_name, e.job_id, e.department_id, d.department_name, l.city
From employees e
Join departments d on (e.department_id=d.department_id)
Join locations l using (location_id)
Where lower(l.city) ='toronto';

Select  e.employee_id, e.last_name, m.manager_id, m.last_name
from employees e
Join employees m on (e.manager_id=m.employee_id);

Select  e.employee_id, e.last_name, m.manager_id, m.last_name
from employees e
Left Outer Join employees m on (e.manager_id=m.employee_id)
Order by 2;

Select  e.last_name, e.department_id, m.last_name
from employees e
Join employees m on (e.department_id=m.department_id)
where e.employee_id <> m.employee_id
Order by 1,2,3;

Select *
from employees e Join employees d
on (d.last_name='Davies')
Where d.hire_date<e.hire_date
Order by e.hire_date;

select *
From employees
where last_name='Davies';

Select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e Join employees m
on (e.manager_id=m.employee_id)
Where e.hire_date<m.hire_date;

Create table job_grades
As(
Select 'A' grade_level,1000 lowest_sal,2999 highest_sal From dual
Union
Select 'B',3000,5999 From dual
Union
Select 'C',6000,9999 From dual
Union
Select 'D',10000,14999 From dual
Union
Select 'E',15000,24999 From dual
Union
Select 'F',25000,40000 From dual);


