--------------------------------------------- VIEWS ------------------------------------------------

--=========================================   Basic  ================================================
--Create a view that shows employee full name and department name.
SELECT * FROM get_emp_fullname_department;
--SELECT * FROM DEPARTMENTS;

CREATE OR REPLACE VIEW GET_EMP_FULLNAME_DEPARTMENT AS 
    SELECT E.FIRST_NAME ||' '||E.LAST_NAME AS FULLNAME,D.DEPARTMENT_NAME FROM EMPLOYEES E 
    JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--Create a view that lists all employees with salary above 10,000.

CREATE OR REPLACE VIEW EMP_WITH_SALARY_GREATER_10000 AS
    SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY > 10000;
    
SELECT * FROM EMP_WITH_SALARY_GREATER_10000;


--Create a view to display only those employees who have a manager.

CREATE OR REPLACE VIEW EMP_WITH_MANAGER AS
    SELECT FIRST_NAME,LAST_NAME,SALARY,EMAIL FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;
    
SELECT * FROM EMP_WITH_MANAGER;


--Create a view that joins EMPLOYEES and DEPARTMENTS on DEPARTMENT_ID.

--Create a view that shows employee name, salary, and a calculated annual salary.

--============================================= Medium  ====================================================

Create a view that only includes employees from the "SALES" department.

Create an updatable view to update employee salaries.

Create a view that shows departments with no employees.

Create a view that shows the total salary by department.

Create a view with a check option to restrict department updates.


--=============================================  Hard  ==========================================================

--Create a complex view that shows department name, number of employees, and total salary.

    CREATE OR REPLACE VIEW GET_DEPARTMENT_NAME_EMPLOYEE_SALARY AS
        SELECT D.DEPARTMENT_NAME,COUNT(*) AS TOTAL_EMPLOYEES,SUM(E.SALARY) AS TOTAL_SALARY FROM EMPLOYEES E 
        JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID GROUP BY D.DEPARTMENT_NAME;
        
    SELECT * FROM GET_DEPARTMENT_NAME_EMPLOYEE_SALARY;

--Create a view that includes employees and shows if they are senior (salary > 15000) or junior.

    CREATE OR REPLACE VIEW POSITION_OF_EMPLOYEES AS
    SELECT FIRST_NAME, SALARY,
        CASE
            WHEN SALARY > 15000 THEN 'SENIOR'
            WHEN SALARY <= 15000 THEN 'JUNIOR'
        END AS SENIOR_OR_JUNIOR
    FROM EMPLOYEES;
    
    SELECT * FROM POSITION_OF_EMPLOYEES;

--Create a view that lists managers and their subordinates using self-join.

--Create a view to show employee name and job history (assuming a history table).

--Create a read-only view that joins three or more tables (with sample data if needed).