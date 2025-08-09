
--   Create a view to show only employee full names and their job titles.

    CREATE OR REPLACE VIEW SHOW_EMP_FULL_NAME AS 
    SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,JOB_TITLE FROM PRACTICE;
    
    
    SELECT * FROM  SHOW_EMP_FULL_NAME;

--   Create a view that displays employees who earn more than 50,000.

    CREATE OR REPLACE VIEW DISPLAY_EMP_5K AS 
    SELECT * FROM PRACTICE WHERE SALARY > 50000;
    
    
    SELECT * FROM DISPLAY_EMP_5K;

--   Create a view to show employee details without showing their salary.

    CREATE OR REPLACE VIEW HIDE_EMP_SALARY AS 
    SELECT EMP_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_TITLE,DEPARTMENT_ID,MANAGER_ID
    FROM PRACTICE;
    
    
    SELECT * FROM HIDE_EMP_SALARY;


--   Create a view that shows employee names, hire date, and years of experience.

    CREATE OR REPLACE VIEW SHOW_EMPLOYEE_EXPE AS
    SELECT FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) AS EXPERIENCE_MONTHS FROM PRACTICE;
    
    SELECT * FROM SHOW_EMPLOYEE_EXPE;
    
    SELECT * FROM PRACTICE;


--   Create a view that shows each department and the number of employees in it.
     SELECT * FROM PRACTICE;
     desc practice;
     
--     select * from practice;/
     INSERT INTO PRACTICE VALUES(11,'John','Doe','john.doe@example.com',1234567890,'15-01-20','Developer',60000,101,null);
     
     
--     select first_name,count(email) from practice group by first_name having count(*) > 1;

;

delete from table (select practice.*,dense_rank() over(partition by email order by emp_id)as d from practice) as p where p.d > 1;
     
select * from (select practice.*,dense_rank() over(partition by email order by emp_id)as d from practice) p;


select * from practice;

DELETE FROM practice
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM practice
    GROUP BY email
);


--types of triggers;

--row_id


--   how to delete duplicate data from table

--   procedrue, function, cursor, trigger   basic theory   


--    