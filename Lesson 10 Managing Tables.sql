Create table jobs_old as
Select *
From jobs;

Create table employees_old as
Select *
From employees;

Create table departments_old as
Select *
From departments;

Create table job_history_old as
Select *
From job_history;

Create table locations_old as
Select *
From locations;

Create table countries_old as
Select *
From countries;

Create table regions_old as
Select *
From regions;

Create table job_grades_old as
Select *
From job_grades;

INSERT INTO departments_old (department_id, department_name, manager_id, location_id)
VALUES (70, 'Public Relations', 100, 1700);

Select *
From departments_old;

INSERT INTO departments_old (department_id, department_name, manager_id, location_id)
VALUES (100, 'Finance', NULL, NULL);

Delete from departments_old
where department_id =70
and manager_id =100;



INSERT INTO departments_old
VALUES (100, 'Finance', null, null);

INSERT INTO departments_old (department_id, department_name)
VALUES (100, 'Finance');

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relationship', 100, 1700);


INSERT INTO departments (department_id, department_name)
VALUES (281, 'Public Relationship');

INSERT INTO departments (department_id, department_name,manager_id, location_id)
VALUES (&department_id, '&department_name', &manager_id, &location_id);

Insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
Values (207, 'Cornelia', 'Sirbu', 'cornelia@gmail.com', '069.442.243', sysdate, 'FI_MGR', 20000, NULL, 100, 100);


Select *
from employees
order by 1 desc;

insert into sales_reps (id, name, salary, commission_pct)
Select employee_id, last_name, salary, commission_pct
From employees
where job_id like '%PROG%';

Select * from sales_reps;

Create table sales_reps
(ID NUMBER(6) ,
NAME VARCHAR2(25),
SALARY NUMBER(8,2),
COMMISSION_PCT NUMBER(2,2));

insert into sales_reps (id, name, salary, commission_pct)
Select employee_id, last_name, salary, commission_pct
From employees;

Select * from sales_reps;

Delete from sales_reps_2; --sterge totul din tabel
Drop table sales_reps_2;  --sterge intreg tabelul

UPDATE employees
SET department_id=50
where employee_id =113;

Select * from employees
where employee_id =113;

Update employees
Set department_id=50
    ,first_name = 'Luis'
    ,phone_number='515.214.4540'
where employee_id=113;

Update employees
SET (Job_id, salary)= (Select job_id, salary
                       From employees
                       where employee_id=205)
where employee_id=113;

Insert into copy_emp (empno, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
Select employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
from employees;

Select * from copy_emp;
Select * from employees;

UPDATE copy_emp
SET department_id= (Select department_id
                    From employees
                    where employee_id=100)
Where job_id= ( Select job_id
                From employees
                Where employee_id=200);

UPDATE copy_emp
SET department_id= (Select department_id
                    From employees
                    where employee_id=100)
Where job_id= ( Select job_id
                From employees
                Where employee_id=130);

Select *
From employees;

Delete From employees
where employee_id>206;

Select *
From employees
where department_id=70;

Delete from employees
where department_id in (Select department_id
                        From departments
                        where lower(department_name) like '%public%');

Select *
from copy_emp;

TRUNCATE table copy_emp; --sterge toate rindurile din tabel ca si functia delete, doar ca e mai rapid ca delete.

Start transaction
Delete from copy_emp
where department_id in (280,281,282,283,70);
savepoint update1;
rollback to update1;

Select * from copy_emp
order by empno;
commit;
rollback;

Insert into copy_emp
VALUES (210,'Pat','Fay','PFAY','603.123.6666','17-AUG-13','MK_REP',6000,NULL,201,20);
SAVEPOINT UPDATE2;

DELETE FROM copy_emp
where department_id=60;

Rollback to UPDATE2;

Select * from copy_emp
where empno=210;

commit;

-- exercitii
--1)
Create table my_employee
(ID NUMBER(4) CONSTRAINT MY_EMPLOYEE_ID_PK PRIMARY KEY ,
LAST_NAME VARCHAR2(25),
FIRST_NAME VARCHAR2(25),
USERID VARCHAR(8),
SALARY NUMBER(9,2));

DESC MY_EMPLOYEE;
commit;

--3 &4)
INSERT INTO my_employee
--VALUES (1, 'Patel', 'Ralph','rpatel', 895);
--VALUES(2, 'Dancs', 'Betty','bdancs', 860);
--VALUES(3, 'Biri', 'Ben','bbiri', 1100);
--VALUES(4, 'Newman', 'Chad','cnewman',750);
VALUES(5, 'Ropeburn', 'Audrey','aropebur',1550);

--5 & 8)
Select *
From my_employee;

--6 &7)
Insert into my_employee
VALUES (&p_id, '&p_last_name', '&p_first_name', '&p_userid', &p_salary);

commit;

--9)
UPDATE my_employee
SET last_name ='Drexler'
where id=3;

--11)
UPDATE my_employee
SET salary =1000
where salary <900;

--13)
DELETE my_employee
where last_name ='Dancs';
--18)
savepoint step1;
--19)
Delete from my_employee;

rollback to step1;
commit;

