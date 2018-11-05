Select last_name, hire_date
From employees
Where hire_date > (Select hire_date
                   From employees
                   Where last_name = 'Davies')
And hire_date < (Select hire_date
                   From employees
                   Where last_name ='Bull')
Order by 2;

Select last_name, job_id, salary
From employees
Where job_id = (Select job_id
               From employees
               Where last_name = 'Taylor' AND FIRST_NAME='Winston')
And salary >  (Select salary
               From employees
               Where last_name ='Taylor' AND FIRST_NAME='Winston');
               
Select *
From employees
Where salary = (Select Min(salary)
                From employees);

Select *
From employees
Where salary > (Select avg(salary)
                From employees
                where department_id=80)
And department_id=80;

Select department_id, min(salary)
From employees
Group by department_id
Having min(salary) > (Select min(salary)
                      From employees
                      WHere department_id=80);
                      
Select department_name, count(employee_id)
From departments d
Left Join employees e on (d.department_id=e.department_id)
Group by department_name
Having count(employee_id) >0
Order by 2 desc;

Select *
From employees
where salary in (Select min(salary)
                 From employees
                 Group by department_id);

--exercitiu 1
SELECT LAST_NAME, HIRE_DATE
From employees
Where department_id in (select department_id
                     From employees
                     where last_name='&&last_name')
And last_name <>'&last_name';

--exercitiu 2                     
Select employee_id, last_name, salary
from employees
where salary > (select avg(salary)
                from employees)
Order by salary;

--exercitiu 3
SELECT employee_id, LAST_NAME, department_id
From employees
Where department_id in (select department_id
                     From employees
                     where last_name like '%u%');

--execitiu 4                     
Select last_name, department_id, job_id, location_id
From employees
Join departments using (department_id)
where location_id=1700;

Select last_name, department_id, job_id
From employees
where department_id in (select department_id
                        from departments
                        where location_id=&enter_location);

--exercitiu 5                       
Select last_name, salary, manager_id
From employees
where manager_id in (select employee_id
                    from employees
                    where last_name='King');

--exercitiu 6
Select department_id, last_name, job_id
from employees
where department_id = (select department_id
                       from departments
                       where department_name='Executive');

--exercitiu 7
Select last_name, salary
From employees
where salary > any (select salary
                    From employees
                    where department_id=60);
                       
--exercitiu 8
SELECT employee_id, LAST_NAME, salary
From employees
Where department_id in (select department_id
                     From employees
                     where last_name like '%u%')
and salary > (select avg(salary) 
              From employees);
              
Select *
From employees
Where salary < ANY (select salary     --returneaza less than maximum
                    From employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PROG'
Order by salary desc;

Select *
From employees
Where salary < ALL (select salary      --returneaza less than minimum
                    From employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PROG'
Order by salary desc;

Select *
From employees
Where salary IN (select salary      --returneaza valorile doar din select
                    From employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PROG'
Order by salary desc;

Select *
From employees
Where salary not IN (select salary      
                    From employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PROG'
Order by salary desc;

-- Multi-column subqueries
Select first_name, department_id, salary --returneaza persoanele care au salariu minim per departanent
From employees
Where (salary, department_id) in (select min(salary), department_id 
                                  From employees
                                  Group by department_id)
Order by department_id;

Select *  -- toti angajatii care nu sunt manageri
From employees
where employee_id not in (Select manager_id
                          From employees
                          where manager_id is not null);
-- Not in (1,2, null) - nu returneaza nimic, fiindca not in (1 or 2 or null) = in(1 and 2 and null) = false

--Inner Join scris altfe prin Where
Select b.*
From employees a
Join employees b on a.manager_id=b.employee_id;

Select b.*
From employees a, employees b 
where a.manager_id=b.employee_id;

--Left Join scris altfel prin Where=(+)
Select b.*
From employees a
Left Join employees b on a.manager_id=b.employee_id;

Select b.*
From employees a, employees b 
where a.manager_id=b.employee_id (+);

--Right Join scris altfel prin Where(+)=
Select b.*
From employees a
Right Join employees b on a.manager_id=b.employee_id;

Select b.*
From employees a, employees b 
where a.manager_id(+)=b.employee_id;
