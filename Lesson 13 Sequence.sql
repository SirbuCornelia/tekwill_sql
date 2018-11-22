CREATE SEQUENCE DEPT_deptid_seq
                 START WITH 280
                 INCREMENT BY 10
                 MAXVALUE 9999
                 NOCACHE
                 NOCYCLE;

CREATE SEQUENCE My_first_Sequence
                 START WITH 280
                 INCREMENT BY 10
                 MAXVALUE 1000
                 NOCACHE
                 NOCYCLE;
                 

Select My_First_Sequence.CurrVAL
From dual;

Select My_First_Sequence.NextVAL
From dual;

Select * from departments
order by 1 desc;

Insert into departments
Values (My_first_sequence.NextVAL, 'acvbd', 205, 1700);

Create sequence Sequence_1
                START with 1
                Increment by 1
                NoCache
                NoCycle;

Create Table Test_Seq (ID Number Default Sequence_1.NextVal not null
              ,name Varchar2(15)
              ,description Varchar2(100));

Insert Into Test_Seq (name, description)
Values('abc','description1');

Select * from Test_Seq;

Alter sequence Sequence_1    --pentru a modifica secventa
                Increment by 100
                MaxValue 100000
                NoCache
                NoCycle;

Describe user_sequences;

Select * from user_sequences; --pentru a vedea din dictionary toate secventele create

Create SYNONYM dept
FOR departments;

Drop SYNONYM dept;

Describe user_synonyms;
Select * from user_synonyms;

Select * from employees
where email='DLORENTZ';

Select * from employees a
Left Join departments b
On a.department_id=b.department_id;

Select * 
from recyclebin;

Select * 
from employees;


Select * 
from employees
where email ='DAUSTIN'
and employee_id=105;


Create Index Test_Index
on employees (hire_date);

desc employees;


Create table Test_Table_Index
(EMPLOYEE_ID  NUMBER(6)  primary key 
       Using Index(Create Index Test_Index_emp on Test_Table_Index(EMPLOYEE_ID) ),    
FIRST_NAME VARCHAR2(20), 
LAST_NAME  VARCHAR2(25) NOT NULL, 
EMAIL  VARCHAR2(25) NOT NULL, 
PHONE_NUMBER  VARCHAR2(20));

Select * 
from user_indexes
where lower(table_name)=lower('Test_Table_Index');


Create Index Test_Index_LastName
on Test_Table_Index(Upper(last_name)); 

Select * 
from Test_Table_Index
where upper(last_name) = 'Pataballa';

Select *
from user_ind_columns
where upper(table_name)=upper('Test_Table_Index');













