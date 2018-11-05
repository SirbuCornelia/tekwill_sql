Select distinct b.*, 'Employees_Manager' as emp_type
From employees a
join employees b
on a.manager_id =b.employee_id
Union
Select a.*, 'Department_manager' as emp_type
From employees a
Join departments b
on a.employee_id=b.manager_id;

Select distinct b.*
From employees a
join employees b
on a.manager_id =b.employee_id
Union    --uneste 2 tabele si exclude dublicatele
Select a.*
From employees a
Join departments b
on a.employee_id=b.manager_id;

Select distinct b.*
From employees a
join employees b
on a.manager_id =b.employee_id
Union  ALL   --uneste 2 tabele si nu exclude dublicatele
Select a.*
From employees a
Join departments b
on a.employee_id=b.manager_id;

Select distinct b.*
From employees a
join employees b
on a.manager_id =b.employee_id
Intersect   --uneste 2 tabele si ofera datele comune
Select a.*
From employees a
Join departments b
on a.employee_id=b.manager_id;

Select distinct b.*
From employees a
join employees b
on a.manager_id =b.employee_id
Minus  --uneste 2 tabele si ofera datele distince din primul tabel
Select a.*
From employees a
Join departments b
on a.employee_id=b.manager_id;

Select t2.job_title, t1.*
From (Select distinct b.*
      From employees a
      join employees b
      on a.manager_id =b.employee_id
      Union   
      Select a.*
      From employees a
      Join departments b
      on a.employee_id=b.manager_id) t1
Left join jobs t2
on t1.job_id=t2.job_id;

Insert Into retired_emps
Select 209,'Nanc Gren'  ,'FI_MGR'  ,100,'17-AUG-10','17-AUG-15',12008,null,80 From dual
Union ALL
Select 210,'Danel Faet' ,'ST_CLERK',123,'16-AUG-10','10-JUL-12',9000,0.35,90 From dual    
Union All
Select 211,'Jon Chn'     ,'PU_MAN'  ,131,'28-SEP-13','05-DEC-14',8200,1.15,80 From dual
Union All
Select 212,'Doug Gree'  ,'SH_CLERK',147,'13-JAN-16','13-MAY-18',2600,null,50 from dual
Union all
Select 213,'Jenn Whal'  ,'AD_ASST' ,108,'17-SEP-11','17-OCT-15',4400,0.25,10 from dual
Union all
Select 214,'Mich Hart'    ,'MK_MAN'  ,149,'17-FEB-12','20-FEB-13',13000,0.2,20 from dual
Union all
Select 215,'Pa Fy'      ,'MK_REP'  ,205,'17-AUG-13','17-NOV-14',6000,null,20 from dual;

Select first_name|| ' ' || last_name as "Employee's name", job_id, hire_date, salary
From employees
Union
Select ename, job, hiredate, sal
From retired_emps;

Select first_name|| ' ' || last_name as "Employee's name", job_id, hire_date, salary
From employees
Intersect
Select ename, job, hiredate, sal
From retired_emps;

Insert Into retired_emps
Select 2015,'TJ Olson'  ,'ST_CLERK'  ,100,'10-APR-15','17-AUG-15',2100,null,80 From dual;
 
Select first_name|| ' ' || last_name as "Employee's name", job_id, hire_date, salary
From employees
Intersect
Select ename, job, hiredate, sal
From retired_emps;

Select first_name|| ' ' || last_name as "Employee's name", job_id, hire_date, salary
From employees
Intersect
Select ename, job, hiredate, sal
From retired_emps;

Select first_name|| ' ' || last_name as "Employee's name", job_id, hire_date, salary
From employees
Minus
Select ename, job, hiredate, sal
From retired_emps
order by 1;
