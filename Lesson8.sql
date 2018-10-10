select round(to_date('18-apr-18','dd-mm-yyyy'),'month') as explicit_conversion
       ,last_day('16-apr-18') implicit_date_cnversion
       ,months_between('12-JUL-16','12-JUL-15') implicit_date_cnversion1
from dual;

select hire_date || q'{'it's date}'
       ,to_char(hire_date,'Day-dd-month-yyyy') as "Date"
       ,to_char(hire_date,'dd-mm-yyyy') as "Date1"
from employees;

Select  hire_date
       ,to_char(hire_date,'DD-MM-YYYY') as to_char1
       ,to_char(hire_date,'Day.Month.YYYY') as to_char2
       ,to_char(hire_date,'DD/MM/YYYY HH24:MI:SS') as to_char3
       ,to_char(hire_date,'DD "of" Month YYYY') as to_char4
       ,to_char(hire_date,'Ddspth "of" Month') as to_char5
       ,to_char(hire_date,'fmDD "of" Month') as to_char5
       ,to_char(hire_date,'fmDay.Month.YYYY') as to_char5 --fm grupeaza caracterele sa fie impreuna
from employees;

Select to_char(employee_id,'999.999') as to_char1
       ,to_char(employee_id,'999L') as Lira
       ,to_char(employee_id,'$999') as USD
       ,to_char('123568.987','$999,999.99') as to_char1
       ,replace(phone_number,'.',',') as replace1
       ,to_number(replace(phone_number,'.',','),'999,999,9999') as  to_number
From employees
where employee_id between 100 and 144;

Select salary
       ,to_char(salary,'$999,999') as salary
From employees;

Select to_number('1740.27','9999.99')
From dual;

SELECT *
FROM EMPLOYEES
where hire_date=to_date('17-06-2011','DD.MM.YYYY');

Select months_between(to_date('17-06-2011','dd.mm.yyyy'),sysdate)
from dual;

Select salary
      ,commission_pct
      ,nvl(commission_pct,0) as substitution_commission
      ,salary*nvl(commission_pct,1) as full_salary
From employees;

Select *
from employees
where nvl(commission_pct,0)<=0.2;

Select salary
       ,commission_pct
       ,nvl2(commission_pct,salary*(1+commission_pct),salary) as nvl2
       ,nullif(round(salary/3,2),trunc(salary/3,2))as nullif --returneaza null daca valorile sunt egale, si expr1 daca nu sunt egale
       ,coalesce('','','abc','null') as coalesce1
       ,coalesce(commission_pct, manager_id, department_id) as return_first_notnullval
       ,coalesce(salary+(commission_pct*salary),salary+2000) as increased_salary
from employees;

Select first_name|| ' ' || last_name || ' earns' || to_char(salary,'$99,999.00') || ' monthly but wants' || to_char(salary*3,'$99,999.00') as "Dream Salary"
From employees;

Select first_name, student_reg_year
       ,to_char(next_day(add_months(student_reg_year,6), 'MONDAY'), 'fmDay, "the" Ddspth "of" Month, YYYY') as REVIEW
From ad_student_details;

Select first_name, email_addr
       ,NVL(email_addr, 'No Email Address') as Contact_info
From ad_student_details;

Select student_id, marks, to_char(marks,'$99') Prize_amount
From ad_exam_results
Where marks>=90;





