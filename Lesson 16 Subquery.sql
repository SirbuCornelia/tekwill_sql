Select *
From departments
Natural Join (SELECT l.location_id, l.city, l.country_id
              From locations l
              Join countries c
              On (l.country_id=c.country_id)
              Join regions
              Using (region_id)
              Where region_name='Europe');

Select *
From departments d
Natural Join locations l
Join countries c
On (l.country_id=c.country_id)
Join regions
Using (region_id)
Where region_name='Europe';

Create view european_cities as
SELECT l.location_id, l.city, l.country_id
              From locations l
              Join countries c
              On (l.country_id=c.country_id)
              Join regions
              Using (region_id)
              Where region_name='Europe';
              
Select *
From departments
Natural Join european_cities;

Select *
From employees
where job_id in (Select job_id
                 From employees
                 where last_name='De Haan');
                 
Select *
From employees
Where (manager_id, department_id) IN (Select manager_id, department_id
                                      From employees
                                      Where employee_id IN (174,199))
AND employee_id NOT IN (174, 199);

Select *
From employees
Where manager_id IN (Select manager_id
                     From employees
                     Where employee_id IN (174,141))
AND department_id IN (Select department_id
                     From employees
                     Where employee_id IN (174,141))
AND employee_id NOT IN (174, 141);

Insert into employees
values (500, 'Donald', 'OConnell','asdfg','650.507.9833','21-JUN_15', 'SH_CLERK',2600,null,149,50);

Insert into employees
values (502, 'Donald', 'OConnell','asdfgf','650.507.9833','21-JUN_15', 'SH_CLERK',2600,null,124,80);

Select Case When department_id= (Select department_id
                                 From departments
                                 where location_id=1800) Then 'Canada' 
            When department_id= (Select department_id
                                 From departments
                                 where location_id=1300) Then 'Hiroshima' 
            else 'USA' END as scalar_case
      ,a.*
From employees a;

Select a.*
       ,(Select count(*)
         From employees b
         where b.department_id=a.department_id) as Count_employees
From departments a;

Select a.* --asa select nu va merge fiindca subselectul returneaza mai multe valori
       ,(Select count(*)
         From employees
         Group by department_id)
From departments a;

Select t1.*
From employees t1
Where salary > (Select AVG (Salary)
                From employees t2
                where t1.department_id=t2.department_id);

--sau poti obtine aceleasi date astfel:
Select *
from employees d
join (Select avg(salary) as avg_salary
              ,department_id
       from employees
       group by department_id) e
on d.department_id=e.department_id;

Select t1.*
From employees t1
Where salary = (Select MAX(Salary)
                From employees t2
                where t1.department_id=t2.department_id);

-- ne afiseaza toti managerii                
Select *
From employees r
Where exists (Select null ---sau in loc de null pui manager_id, ai acelasi rezultat
              From employees t
              Where r.employee_id=t.manager_id);

Select distinct manager_id
from employees;

Select t.*
From employees r
left Join employees t on r.manager_id=t.employee_id;

-- ne afiseaza toti angajatii fara manageri                
Select *
From employees r
Where  not exists (Select manager_id
              From employees t
              Where r.employee_id=t.manager_id);

--returneaza departamente care nu are angajati
Select * from departments g
where not exists (Select Null
                  From employees r
                  Where g.department_id=r.department_id);


Select f.first_name, f.last_name, f.email, f.hire_date, d.department_name, j.job_title, j.min_salary, j.max_salary
from (Select *
      From employees r
      Where exists (Select null ---sau in loc de null pui manager_id, ai acelasi rezultat
                    From employees t
                    Where r.employee_id=t.manager_id)) f
Left Join departments d on d.department_id=f.department_id
Left Join jobs j on j.job_id= f.job_id;

--cu WITH se citeste tabelul mult mai repede
WITH  f as (Select *
      From employees r
      Where exists (Select null ---sau in loc de null pui manager_id, ai acelasi rezultat
                    From employees t
                    Where r.employee_id=t.manager_id))
,d as (Select *
        From departments)
,j as (Select *
        From jobs)
Select * from f
Left Join  d on d.department_id=f.department_id
Left Join  j on j.job_id= f.job_id;


Create table Flights  as 
Select 'San Jose' as source
       ,'Los Angeles' as destination
       ,1.3 as flight_times
From dual
 Union
 Select 'New York' as source
       ,'Boston' as destination
       ,1.1 as flight_times
From dual
Union
Select 'Los Angeles' as source
       ,'New York' as destination
       ,5.8 as flight_times
From dual;
               
With Reachable_From (Source, Destination, flight_times) as
 (Select source, destination, flight_times
 from Flights
 Union all
 Select incoming.source, outgoing.destination
        ,incoming.flight_times+outgoing.flight_times as total_time
 from Reachable_From  incoming, Flights outgoing
 where incoming.destination =outgoing.Source
 )
 Select *
 From Reachable_From
 Order by 3 desc;


