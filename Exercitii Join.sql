--1) a
--Scrieti un select pentru a afisa numele angajatilor si numele departamentului in care acestia lucreaza.

Select first_name, last_name, department_name
From employees
Join departments using (department_id)
Order by 3;

--1) b
--Afisati citi angajati lucreaza in fiecare departament,ordonati descrescator dupa numarul de angajati

Select department_name, count(employee_id) as "Nr angajati"
From employees
Join departments using (department_id)
Group by department_name
Order by 2 desc;


--2)Scrieti un select care va afisa pentru toti angajatii numele angajatului, al departamentului,
--al tarii,al orasului,al provinciei si numele Regiunii din care-i adresa pe care locuieste.

Select e.first_name, e.last_name, d.department_name,c.country_name, l.city, l.state_province, r.region_name 
From employees e
Left Join departments d on e.department_id=d.department_id
Left Join locations l on d.location_id=l.location_id
Left Join countries c on c.country_id=l.country_id
Left Join regions r on r.region_id=c.region_id
Order by 1;

--3)
--Scrieti un Select care va afisa first_name, last_name si salariul pentru acei angajati care cistiga mai
--putin decit angajatul cu employee_id 182.

Select e.first_name, e.last_name, e.salary
From employees e
Join employees j on (j.employee_id='182')
where e.salary<j.salary;

--4)Afisati toti angajatii cu numele lor complet, la fel si pentru managerul acestora,salariile lor
--si care este diferenta de salariu dintre angajat si manager indiferent daca angajatul
--lucreaza sau nu sub un careva manager.
--Numiti coloanele afisate corespunzator.

Select  e.first_name|| ' ' || e.last_name, e.salary 
        ,m.first_name ||' ' || m.last_name, m.salary ,abs(m.salary-e.salary) as "Diferenta salariu"
From employees e
Left Join employees m on m.employee_id=e.manager_id;


--5)Scrieti un select care ar afisa numele angajatului si al departamentului pentru persoanele care lucreaza
--in aceleasi departament ca si angajatii care contin in nume/last_name "Taylor"

Select e.first_name, e.last_name, d.department_name
From employees e
Join employees t on (t.last_name='Taylor')
Join departments d on (e.department_id=d.department_id)
where e.department_id=t.department_id;


--6)Scrieti un select pentru a afisa numele angajatilor, salariul actual si diferenta dintre
--salariul maxim pe care il poate avea in dependenta de job si salariul care-l are la moment.(cu cit ar
--putea sa fie salary encrease pentru el)
--Folosind "natural join"

Select e.first_name, e.last_name, e.salary, j.highest_sal-e.salary as "Adaos maximal salarial"
From employees e
Join job_grades j on (e.salary)
between j.lowest_sal and j.highest_sal
Order by 4 desc;

Select*
from job_grades;

--7) Folosing using Join scrieti un select pentru a afisa titlul jobului, numele departamentului, numele complet
--si data cind a inceput angajatul sa lucreze pentru toate joburile care au inceput dupa 01.jan.93 
--si au finisat inainte de 31.aug.97

Select employee_id, job_title, department_name, first_name, last_name, start_date, end_date
From employees 
Join jobs using (job_id)
Join departments using (department_id)
Join job_history using (employee_id)
where start_date > '01-JAN-93' 
And start_date < '31-AUG-97' 
ORDER BY 6; 

Select *
From job_history;

--8)Scrieti un select pentru a afisa numele departamentului, salariul mediu pe departament si numarul
--de angajati doar care primesc comision.

Select d.department_name, round(avg(salary))as Average_salary, count(employee_id) as Nr_angajati
From employees e
Left Join departments d on (e.department_id=d.department_id)
where e.commission_pct is not null
Group by d.department_name;

--9) Scrieti un select p/u a a afisa numele complet , job name pentru acei angajati care lucreaza in departamentul 80
--Scrieti toate variantele posibile utilizind toate tipurile de join.

Select first_name, last_name, department_name, job_title
From employees
Join  Departments using (department_id)
Join Jobs using (job_id)
Where department_id=80;

Select e.first_name, e.last_name, d.department_name, j.job_title
From employees e
Join  Departments d on (e.department_id=d.department_id)
Join Jobs j on (e.job_id=j.Job_id)
Where d.department_id=80;

Select e.first_name, e.last_name, d.department_name, j.job_title
From employees e
Left Join  Departments d on (e.department_id=d.department_id)
Left Join Jobs j on (e.job_id=j.Job_id)
Where d.department_id=80;

--10) Scrieti un select pentru a afisa tara, orasul si numele departamentului pentru toate adresele definite

Select location_id,street_address, city, country_name
From locations
Join Countries using (country_id);

Select location_id,street_address, city, country_name
From locations l
Left Join Countries  c on (l.country_id=c.country_id);

--11) Afisati numele departamentului si numele complet al managerului de departament

Select distinct d.department_id, d.department_name, d.manager_id, m.first_name, m.last_name 
From departments d
Left Join employees e on (d.manager_id=e.manager_id)
Left join employees m on (m.employee_id=e.manager_id)
where d.manager_id is not null;


--12) Scrieti un query pentru a afisa numele jobului si salariul mediu pe angajat

Select job_title, avg(salary)
From employees
Join Jobs using (job_id)
Group by job_title;

--13) Scrieti un select pentru a afisa titurile joburilor care au fost obtinute
--de oricare din angajati care in prezent cistiga un salariu mai mare de 12000

Select job_title, salary
From job_history 
Join jobs using (Job_id)
Join employees using (employee_id)
Where salary >12000;

--14) Scrieti un select pentru a afisa numele departmentului, numele managerului si orasul acestora

Select distinct d.department_id, d.department_name, d.manager_id, m.first_name,m.last_name,  l.city
From departments d
Left Join employees e on (d.manager_id=e.manager_id)
Left join employees m on (m.employee_id=e.manager_id)
Left Join locations l on (l.location_id=d.location_id)
Order by 1;
