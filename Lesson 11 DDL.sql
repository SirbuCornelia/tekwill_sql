CREATE TABLE My_First_Table
             (deptno NUMBER(2)
             ,dname  VARCHAR2(14)
             ,loc    VARCHAR2(13)
             ,create_date DATE DEFAULT sysdate);

Select * from My_First_Table;

Insert into My_first_table
Values (1,'Test Depart', 'Undefinded',sysdate);

Insert into My_first_table (deptno, dname, loc, create_date)
Values (2,'Test Depart', 'Unkown','10-OCT-18');

Select localtimestamp from dual;

CREATE TABLE My_First_Table_2
             (deptno NUMBER(2)
             ,dname  VARCHAR2(14)
             ,loc    VARCHAR2(13)
             ,create_date timestamp DEFAULT localtimestamp);
             
Select * from My_First_Table_2;    

Insert into My_first_table_2
Values (1,'Test Depart', 'Undefinded',localtimestamp);

Create Table HR_Table(employee_id  NUMBER(6) CONSTRAINT EMP_employee_id Primary Key
                     ,first_name  VARCHAR2(50)
                     ,last_name   VARCHAR2(50));
Desc HR_table;

Insert into HR_Table (employee_id, first_name, last_name)
VALUES (2,'Ana','Popovici');

Select * from HR_Table;

--a 2 varianta de creare a unei primary key legat de tabel si nu de coloana
Create Table HR_Table_2(employee_id  NUMBER(6) 
                     ,first_name  VARCHAR2(50)
                     ,last_name   VARCHAR2(50)
                     ,salary      NUMBER(6,2) NOT NULL
                     ,CONSTRAINT EMP_employee_id_2 Primary Key (employee_id));

Create Table HR_Table_3(employee_id  NUMBER(6) CONSTRAINT EMP_employee_id_3 Primary Key
                     ,first_name  VARCHAR2(50)
                     ,last_name   VARCHAR2(50)
                     ,email       VARCHAR2(50) CONSTRAINT EMP_email not null CONSTRAINT EMP_email_2 unique);

--sau    
Create Table HR_Table_4(employee_id  NUMBER(6) 
                     ,first_name  VARCHAR2(50)
                     ,last_name   VARCHAR2(50)
                     ,email       VARCHAR2(50) not null
                     , salary NUMBER(8,2) CONSTRAINT hr_salary CHECK (salary >0)
                     , department_id NUMBER(4)
                     , CONSTRAINT department_id_4 FOREIGN KEY (department_id)  REFERENCES departments (department_id)
                     , CONSTRAINT EMP_employee_id_4 Primary Key (employee_id)
                     , CONSTRAINT EMP_email_4 unique (email));
Drop table HR_Table_5;
Desc HR_TABLE_5;

Create Table HR_Table_5(employee_id  NUMBER(6) 
                     ,first_name  VARCHAR2(50)
                     ,last_name   VARCHAR2(50)
                     ,email       VARCHAR2(50) not null
                     , salary NUMBER(8,2) not null CONSTRAINT hr_salary_5 CHECK (salary >0)
                     , department_id NUMBER(4) CONSTRAINT department_id_5 REFERENCES departments (department_id)
                     , CONSTRAINT EMP_employee_id_5 Primary Key (employee_id)
                     , CONSTRAINT EMP_email_5 unique (email));

Create table employee_old
As Select * from employees;

--exercitii
--1)
Create Table DEPT ( ID     Number(7) CONSTRAINT dept_ID Primary Key
                   ,NAME   VARCHAR2(25));

Desc DEPT;
--2)
Create Table EMP (  ID          Number(7)
                   ,LAST_NAME   VARCHAR2(25)
                   ,FIRST_NAME  VARCHAR2(25)
                   ,DEPT_ID     NUMBER(7));

Desc EMP;
--3)
ALTER TABLE EMP
ADD  COMMISSION  NUMBER(2,2);

--4)
ALTER TABLE EMP
MODIFY  (LAST_NAME  VARCHAR2(50));

--5)
ALTER TABLE EMP
DROP COLUMN FIRST_NAME;

--6)
ALTER TABLE EMP
SET UNUSED (dept_id);

--7)
ALTER TABLE EMP
DROP UNUSED COLUMNS;

--8)
Create table EMPLOYEES3
As Select EMPLOYEE_ID ID,FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID DEPT_ID
from employees;

desc EMPLOYEES3;

--9)
ALTER TABLE employees3 READ ONLY;
--10)
ALTER TABLE EMPLOYEES3
ADD JOB_ID VARCHAR2(10);

ALTER TABLE EMPLOYEES3
drop COLUMN JOB_ID_1;

--11)
ALTER TABLE employees3 READ WRITE;

--12)
ALTER TABLE employees3 READ ONLY;
DROP TABLE EMPLOYEES3;
DROP TABLE EMP;
DROP TABLE dept;