select JOB_TITLE || ' '|| MIN_SALARY || ' '|| MAX_SALARY
from jobs
WHERE job_title like 'P%';


SELECT STUDENT_ID, FIRST_NAME, STUDENT_REG_YEAR as ADMISSION
FROM AD_STUDENT_DETAILS;

SELECT *
FROM AD_COURSE_DETAILS;

SELECT STUDENT_ID
      , FIRST_NAME
      ,STUDENT_REG_YEAR+2 "COUSRE EXPIRY"
FROM AD_STUDENT_DETAILS;

DESCRIBE AD_COURSE_DETAILS;

DESCRIBE AD_STUDENT_DETAILS;

SELECT STUDENT_ID
      ,FIRST_NAME
      ,PARENT_ID
      ,STUDENT_REG_YEAR AS REGISTRATION
FROM AD_STUDENT_DETAILS;

DESC AD_EXAM_DETAILS;

SELECT DISTINCT NAME
FROM AD_EXAM_DETAILS;

SELECT STUDENT_ID "Student #"
      ,FIRST_NAME "Student"
      ,PARENT_ID "Parent Infromation"
      ,STUDENT_REG_YEAR "Registered ON"
FROM AD_STUDENT_DETAILS;

SELECT COURSE_ID || ', ' ||COURSE_NAME AS "Course ID and Title"
FROM AD_COURSE_DETAILS;

DESC AD_EXAM_DETAILS;

SELECT EXAM_ID || ', ' || EXAM_TYPE || ', ' || START_DATE  || ', ' || NAME AS THE_OUTPUT
FROM AD_EXAM_DETAILS;

SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE;

SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
ORDER BY DEPARTMENT_ID DESC;

SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 ANNUAL_SALARY
FROM EMPLOYEES
WHERE SALARY*12>50000
ORDER BY ANNUAL_SALARY;

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, SALARY*12 ANNUAL_SALARY
FROM EMPLOYEES
ORDER BY 3;

SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID
FETCH FIRST 10 ROWS ONLY;

SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, PHONE_NUMBER, SALARY, JOB_ID
FROM EMPLOYEES
WHERE department_id=50
AND JOB_id = 'ST_CLERK'
AND PHONE_NUMBER LIKE '%4';

insert into employees
select location_id
from departments;

SELECT *
FROM EMPLOYEES;

select *
from departments
where location_id=1500;

select*
from locations;

SELECT*
FROM EMPLOYEES
WHERE department_id=60
AND salary between 4000 and 10000;

select last_name, department_id, salary
from employees
where  department_id=60
or department_id=80
and salary>10000;

select last_name, department_id, salary
from employees
where  (department_id=60
or department_id=80)
and salary>10000;

select *
from employees
where  (JOB_ID='SA_REP'
OR JOB_ID='SA_MAN')
AND PHONE_NUMBER LIKE '0%'
ORDER BY SALARY DESC;

select FIRST_NAME || ' ' || LAST_NAME FULL_NAME
      , SALARY AS SALARIU
from employees
WHERE SALARY >5000
ORDER BY SALARIU, FULL_NAME;
--ORDER BY 1,2;

select FIRST_NAME || ' ' || LAST_NAME FULL_NAME
      , SALARY AS SALARIU
from employees
WHERE SALARY >5000
ORDER BY SALARIU DESC, FULL_NAME ASC;

SELECT *
FROM EMPLOYEES
order by employee_id
fetch first 5 rows only; -- ia primele 5 rinduri din tabel

SELECT *
FROM EMPLOYEES
order by salary
fetch first 8 rows with ties; -- afiseaza primele 8 rinduri si mai verifica daca mai jos sunt valori similare

SELECT *
FROM EMPLOYEES
order by employee_id desc
offset 5 rows fetch next 5 rows only;

select*
from employees
where employee_id= &employee; 

select*
from employees
where salary= &salary_num;

select course_name, department_id
from ad_course_details
where course_id=199;

select student_id, marks
from ad_exam_results
where marks not between 65 and 90;

select student_id, first_name, student_reg_year
from ad_student_details
where first_name in ('ROBERT','NINA')
ORDER BY student_reg_year asc;

select course_name, department_id
from ad_course_details
where department_id =20
or department_id=40
order by course_name asc;

select student_id as stundet#, marks as "Semester Marks", course_id
from ad_exam_results
where marks between 65 and 90
and (course_id=199
or course_id=189);

select first_name, student_reg_year
from ad_student_details
where  student_reg_year between '01-JAN-14' and '31-DEC-14'
ORDER BY student_reg_year asc;

select first_name, parent_id
from ad_student_details
where email_addr is null;


select first_name, student_reg_year, email_addr
from ad_student_details
where email_addr is not null
order by student_reg_year asc;

select student_id, marks
from ad_exam_results
where marks >=&marks;




