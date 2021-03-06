SELECT first_name,last_name, job_id, salary,
       CASE job_id when 'IT_PROG' THEN 1.1*salary
                   when 'ST_CLREK' THEN 1.15*salary
                   when 'SA_REP' THEN 1.2*salary
       ElSE salary END REVISED_SALARY
From employees;

SELECT first_name||' ' ||last_name as FullName, salary
       ,CASE When salary<6000 THEN 1.3*salary
             When salary between 6000 and 10000 THEN 1.2*salary
       ElSE salary*1.1 END REVISED_SALARY
       ,abs(salary-(CASE When salary<6000 THEN 1.3*salary
             When salary between 6000 and 10000 THEN 1.2*salary
       ElSE salary*1.1 END)) NetIncrease
From employees;

SELECT first_name,last_name, job_id, salary,manager_id,department_id
       ,CASE job_id when 'IT_PROG' THEN 1.1*salary
                   when 'ST_CLREK' THEN 1.15*salary
                   when 'SA_REP' THEN 1.2*salary
       ElSE salary END REVISED_SALARY --case for only one column
       ,CASE WHEN job_id='AC_ACCOUNT' AND SALARY>6000 THEN department_id
            WHEN job_id='ST_MAN' AND SALARY<9000 THEN department_id
       ELSE manager_id  END as case_with_more_columns
From employees;

SELECT first_name,last_name, job_id, salary
       ,CASE job_id when 'IT_PROG' THEN 1.1*salary
                   when 'ST_CLREK' THEN 1.15*salary
                   when 'SA_REP' THEN 1.2*salary
       ElSE salary END REVISED_SALARY --case for only one column
       ,DECODE(Job_id,'IT_PROG',1.1*SALARY,'ST_CLREK', 1.15*SALARY,'SA_REP',SALARY*1.2,salary) as DECODE
From employees;

Select exam_type
      ,case exam_type when 'MCE' THEN 'OBJECTIVE'
                      when 'TF' THEN 'OBJECTIVE'
                      when 'FIB' THEN 'OBJECTIVE'
                      when 'ESS' THEN 'SUBJECTIVE'
                      when 'SA' THEN 'SUBJECTIVE'
                      when 'PS' THEN 'ANALYTICAL'
                      when 'LAB' THEN 'PRACTICAL'
        ELSE 'NOT PERMITTED' END "Nature of Exam"
From ad_exam_type;

Select student_id, marks
       ,case when marks<60 then 'fail'
            when marks between 60 and 70 then 'satisfactory'
            when marks between 70 and 80 then 'good'
            when marks between 80 and 90 then 'very good'
            when marks>90 then 'excellent'
        else 'error' end "Grade Remark"
From ad_exam_results;

Select exam_type
      ,decode(exam_type,'MCE','OBJECTIVE','TF','OBJECTIVE','FIB','OBJECTIVE','ESS','SUBJECTIVE','SA',
      'SUBJECTIVE','PS','ANALYTICAL','LAB','PRACTICAL','NOT PERMITTED') "Nature of Exam"
From ad_exam_type;

