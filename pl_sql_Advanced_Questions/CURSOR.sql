--  ====================================    Basic Cursor Questions  ===================================

--Write a PL/SQL block using a cursor to display all employee first names and salaries.
--SELECT * FROM EMPLOYEES;
SET SERVEROUTPUT ON;
DECLARE
    CURSOR EMP IS SELECT * FROM EMPLOYEES;
BEGIN
    FOR I IN EMP LOOP
        DBMS_OUTPUT.PUT_LINE('FIRST NAME: '||I.EMPLOYEE_ID||' AND SALARY IS: ' || I.SALARY);
    END LOOP;
END;
/

--Create a cursor to list all employees hired after the year 2020.


DECLARE
    
Write a PL/SQL block that uses a cursor to print the full name and job ID of each employee.

Create a cursor to fetch and display the email addresses of all employees working in department 90.

Write a PL/SQL block to use a cursor that displays employees who have a non-null COMMISSION_PCT.

--   =====================================   Intermediate Cursor Questions   ==============================

Create a parameterized cursor that fetches employees based on a given department ID.

Write a cursor to increase the salary of employees earning less than 3000 by 10%.

Create a cursor to display all employees who report to a specific MANAGER_ID.

Use cursor attributes like %ROWCOUNT and %FOUND to count how many employees are in department 50.

Write a cursor to find and display employees whose names start with the letter 'A'.

--  ====================================    Advanced Cursor Questions   =================================

--Create a PL/SQL block with a cursor that calculates and displays the annual salary (SALARY * 12) of all employees.

--Write a parameterized cursor to display employees whose salaries fall between a given range.

--Use a cursor FOR loop to display the full name and years of experience of all employees.

--Create a cursor to find employees who have been in the company for more than 5 years and update their salary.

--Write a cursor to group employees by JOB_ID and print the number of employees per job role (manually grouping in PL/SQL).