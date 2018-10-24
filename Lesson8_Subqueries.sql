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
                      

