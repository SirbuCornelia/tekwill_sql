Select *
from employees;

Select * from employees, departments;

Describe dictionary;

Select * from dictionary
Where table_name='USER_OBJECTS';

SELECT * FROM user_objects
ORDER BY CREATED DESC, OBJECT_TYPE DEsc;

Select distinct owner
from all_objects
order by 1;

Select *  -- cross join, inmulteste un tabel cu altul
From employees, departments;

Select *
From employees e
Full outer join departments d 
On e.department_id=d.department_id;

SELECT MOD(11,3), MOD(-10,3), MOD(12,2.5), MOD(10,-3) FROM Dual;
