--   ==============================   Basic Function Questions   =======================

--Write a function that returns the full name (FIRST_NAME + LAST_NAME) of an employee given the EMPLOYEE_ID.


CREATE OR REPLACE FUNCTION GET_FULL_NAME(EMP_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
 RETURN VARCHAR2 IS
 V_FULL_NAME VARCHAR2(200);
 BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO V_FULL_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID = EMP_ID;
    RETURN V_FULL_NAME;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'NO VALUE FOUND';
        WHEN OTHERS THEN
            RETURN 'ERROR';
END;
/


SELECT GET_FULL_NAME(10000) FROM DUAL;

--Create a function that returns the salary of an employee based on their EMAIL.
SELECT * FROM EMPLOYEES;

CREATE OR REPLACE FUNCTION GET_SALARY_FROM_EMAIL(MAIL IN EMPLOYEES.EMAIL%TYPE)
RETURN NUMBER IS
V_SALARY EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT SALARY INTO V_SALARY FROM EMPLOYEES WHERE EMAIL = MAIL;
    RETURN V_SALARY;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN OTHERS THEN 
            RETURN 0;
END;

SELECT GET_SALARY_FROM_EMAIL('sk@gmail.com') FROM DUAL;


--Write a function that takes EMPLOYEE_ID and returns the number of years the employee has been with the company.

CREATE OR REPLACE FUNCTION GET_NUMBER_OF_YEARS(EMP_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2 IS


--Create a function to return the commission amount (SALARY * COMMISSION_PCT) for a given employee.

CREATE OR REPLACE FUNCTION GET_COMMISSION_AMOUNT(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN NUMBER IS
V_COMMISSION NUMBER;
BEGIN
    SELECT (SALARY*COMMISSION_PCT) INTO V_COMMISSION FROM EMPLOYEES WHERE EMPLOYEE_ID = E_ID;
    RETURN V_COMMISSION;
END;

SELECT GET_COMMISSION_AMOUNT(101) FROM DUAL;

--Write a function that returns whether an employee is a manager (i.e., if their EMPLOYEE_ID appears as MANAGER_ID for others).
SELECT * FROM EMPLOYEES;

CREATE OR REPLACE FUNCTION IS_EMP_MANAGER(EMP_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE) 
RETURN VARCHAR2 IS
V_IS_MANAGER VARCHAR2(200);
BEGIN
    SELECT COUNT(*) INTO V_IS_MANAGER FROM EMPLOYEES WHERE MANAGER_ID = EMP_ID;
    IF V_IS_MANAGER > 0 THEN
        RETURN 'YES';
    ELSE 
        RETURN 'NO';
    END IF;
    RETURN V_IS_MANAGER;
END;


SELECT IS_EMP_MANAGER(101) FROM DUAL;


--   ===============================   Intermediate Function Questions   =======================

Create a function that returns the total number of employees in a given department.

Write a function that returns the department name for a given employee (assume a departments table exists).

Create a function that checks whether a given employee was hired in the current year.

Write a function to return the job title (JOB_ID) of the employee earning the highest salary.

Create a function to calculate the average salary of all employees under a given MANAGER_ID.

--   ===============================   Advanced Function Questions   ==========================

--Write a function that returns a string summary: 'Employee [FULL_NAME] earns [SALARY] in [JOB_ID]' for a given EMPLOYEE_ID.

--Create a function that returns TRUE if an employee’s SALARY is above the average salary of their department.

--Write a function that returns a custom grade (e.g., 'A', 'B', 'C') based on employee salary ranges.

--Create a function that returns the hire month (as a string) of an employee.

--Write a function to return the number of employees who have a NULL COMMISSION_PCT.

