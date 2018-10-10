select first_name
       ,last_name
       ,lower(first_name) as lower
       ,upper(last_name) as upper
       ,initcap(last_name) as initcap
from employees;  

select first_name
       ,last_name
from employees
where lower(last_name) like'%a%';
--where upper(last_name) like'%A%';

select first_name ||' '|| last_name as fullname_1
      , concat(first_name,last_name) as full_name_2 -- concat functia doar 2 variable concateneaza
      , substr(first_name,1,3) as substr -- arata de la care caracter sa ia urmatoarele nr de caractere, 1-pozitia si 3-lungimea
      , substr(first_name,-2,3) as substr_1 -- incepem de la sfirsitul ult 2 caractere si urmatoarele 3
      , length(first_name) as Nr_caractere --numare num de caractere
      , instr(first_name, 'a')as instr -- imi arata pozitia cu care se incepe cu acest caracter
      , lpad(first_name, 10,'*') as lpad -- ii dai nr de caractere si sa inceapa de la stinga
      , rpad(first_name, 10,'*') as rpad -- ii dai nr de caractere si sa inceapa de la dreapat
      , instr(lower(first_name), 'e',1,2)as instr --il rogi sa iti dea al 2 e si sa faca skip la primul
from employees;

select substr ('MD-2002, or. Chisinau',1,instr ('MD-2002, or. Chisinau', ',',1,1)-1)
from dual;

define test_string= 'MD-2002, or. Chisinau'
select substr ('&test_string',1,instr ('&test_string', ',',1,1)-1) as zip_code
from dual;

Create table String_Addreses as
Select 'MD-2002,or.Chisinau, str. Mihai Eminescu 12, ap.28' as address from dual
Union
Select '2010,or.Chisinau, str. Grigore Vieru 50, ap.3' as address from dual
Union
Select 'MD2015,or.Chisinau, str. Ion Creanga 4, ap.17'  as address from dual
Union
Select 'md-2030,Chisinau, st. Muncesti 8, ap.54'  as address from dual
Union
Select 'MD-2004,Chisineov, str-da. Bucuriei 2, ap.23'  as address from dual
Union
Select 'Md-2045,or Chisin., s. Ion Inculet 8, ap.50'  as address from dual
Union
Select 'Md2013,chisinau, str. Vasile Lupu 40, ap.20'  as address from dual
Union
Select 'MD2031,or.CHISINAU,'  as address from dual
Union
Select 'md2017,or.CH, str. , ap.28'  as address from dual;

Select *
from String_Addreses;


Select substr(address,1,instr (address, ',',1,1)-1) as Address
       ,concat('MD-', substr(substr(address,1,instr (address, ',')-1),-4)) as Zip_Code
from string_addreses;

Select Lpad(salary,6,'$')
       ,rpad(salary, 6, 'e')
       ,concat(First_Name,concat(' ',Last_Name)) as Full_Name
       ,lower(concat(First_Name,concat(' ',Last_Name))) as full_name
       ,upper(concat(First_Name,concat(' ',Last_Name))) as FULL_NAME
       ,initcap(concat(First_Name,concat(' ',Last_Name))) as Full_Name
from employees;

Select round(45.57585,2)
       ,round(105.57585,-1)
       ,round(150.57585,-2)
       ,trunc(45.57585,2)
       ,trunc(1645.57585,-2)
       ,ceil(24.01)
       ,floor(24.78)
from dual;

select mod(10,5)
       ,mod(10,2)
       ,mod(100,7)
       ,14*7
from dual;

Select sysdate --DATA CURENTA DE LA SERVER
      ,CURRENT_DATE --DATA CURENTA DE LA SESIUNE
      ,SESSIONTIMEZONE
      ,CURRENT_TIMESTAMP
From dual;

SELECT SYSDATE
       ,HIRE_DATE
       ,TRUNC((SYSDATE-HIRE_DATE)/7) AS WEEKS
FROM EMPLOYEES;

Select (sysdate-start_date)/7 weeks
       ,sysdate-start_date days
from Ad_exam_details
where exam_id=550;

SELECT FIRST_NAME || ' ' || LAST_NAME
       ,SYSDATE
       ,HIRE_DATE
       ,ROUND((SYSDATE-HIRE_DATE)/7) AS HOW_OLD_WAS_HIRED
       ,ROUND((SYSDATE-HIRE_DATE)/365) AS NR_YEARS_WORKED
       ,ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) NR_OF_MONTHS
       ,ADD_MONTHS(HIRE_DATE,2) "HireDate+2months"
FROM EMPLOYEES;

SELECT LAST_DAY (SYSDATE)
       ,NEXT_DAY (SYSDATE,'FRIDAY')
       ,NEXT_DAY (SYSDATE,'sat') --poti sa scrii doar minim 3 caractere
       ,ROUND(SYSDATE,'MONTH')
FROM DUAL;

select round(hire_date,'year') as round_year
       ,round(sysdate,'year')
       ,round(to_date('16-apr-18','dd-mm-yyyy'),'month') as sysdate1
from employees;

select first_name, trunc((sysdate-student_reg_year)/7) as Weeks_Completed
from Ad_student_details
where email_addr is null
order by weeks_completed desc;

select exam_id
      ,rpad(' ',exam_id/10,'*') student_and_their_marks
from ad_exam_details;

select first_name, round(months_between(sysdate,student_reg_year)) as Months_Completed
from Ad_student_details
order by months_completed asc;

Select sysdate as "Date"
From dual;

Select student_id, course_id, marks, round(marks*1.155) NewScore
       ,round(marks*1.155)-marks as Increase
From ad_exam_results;

Select Initcap(First_name),length(first_name)
from ad_student_details
where substr(first_name,1,1) in ('J','R','M');

Select Initcap(First_name),length(first_name)
from ad_student_details
where substr(first_name,1,1)like '&start_letter'
Order by first_name;

Select Initcap(First_name),length(first_name)
from ad_student_details
where substr(first_name,1,1)like upper('&start_letter')
Order by first_name;

Select first_name, round(months_between(sysdate,student_reg_year)) as Months_Completed
from ad_student_details
Order by Months_Completed;

select  exam_name, lpad(exam_type,15,'*') as Exam_Code
From ad_exam_type;

Select student_id, rpad(' ',marks/10,'*') Student_and_their_marks
From ad_exam_results
Order by marks DESC;

Select first_Name, round((sysdate-student_reg_year)/7,2) Weeks_completed
From ad_student_details
where email_addr is null
order by weeks_completed desc;