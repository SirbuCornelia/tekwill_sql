Create table employees_old as
Select *
from employees;

Select *
From employees_old;

Desc employees_old;

Alter table employees_old
Add Constraints EMP_PK Primary key (employee_id);
              
Alter table employees_old
Add Constraint Dep_FK foreign key(department_id) references departments (department_id);

--sau

Alter table employees_old
Add  (Constraint EMP_PK Primary key (employee_id)
    ,Constraint Dep_FK foreign key(department_id) references departments (department_id));


Drop table employees_old;

-- poti si asa sa adaugi o cheie primara
Alter table employees_old
Modify employee_id Primary Key;

-- prima varianta de a sterge o cheie primara
Alter table employees_old
Drop constraint SYS_C0023706; --iai acest nume din descriere tabel la tab constraint

-- a doua varianta de a sterge o cheie primara
Alter table employees_old
Drop primary key Cascade;


--1)
Alter table departments_old
Drop primary key Cascade;

--2)
Drop table departments_old;

--3)
Create table departments_old as
Select * From departments;

--4)
Alter table departments_old
Modify department_id Primary Key;

--5)
Alter table employees_old
Add Constraint test_6 foreign key (department_id) references departments_old (department_id) ON Delete SET NULL;

--or
Alter table employees_old
Add Constraint test_1 foreign key(department_id) references departments_old (department_id) ON Delete CASCADE;

--6)
Delete from departments_old
where department_id=30;

--7)
Select *
From employees_old
where department_id is null;

Drop table locations_old;

Create table Locations_old as
Select * from Locations;

Alter table locations_old
Modify location_id Primary Key;

Alter table departments_old
Add Constraint loc_id_fk foreign key(location_id) references locations_old (location_id)on DELETE CASCADE;

Delete from departments_old
where department_id=50;


Select * from locations_old;

Alter table employees_old
Add Constraint test_1 foreign key(department_id) references departments_old (department_id)on DELETE CASCADE;

Delete from locations_old
where location_id=1700;

Select * from departments_old;
Select * from employees_old;

Create table test_table as
Select * from employees;

Drop Table test_table purge; --sterge definitiv tabelul

Select *
From recyclebin;





