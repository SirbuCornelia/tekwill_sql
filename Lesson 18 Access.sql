Create user Test_user1
identified by Test1231;

Grant create session
to test_user1;

Create role manager;

Grant create table, create view
to manager;

Grant manager to test_user1;

Alter user test_user1
IDENTIFIED BY Test123;

Grant select
on employees
to ora43;

Select *
From ora43.employees; --cu conditia ca ora43 mi-a oferit acces la acest tabel.



