 -- =======================   Basic Procedure Questions   ============================

-- Write a procedure to insert a new employee into the employees table.

create or replace procedure insert_emp is
begin
    insert into employees values(208,'Divpreet','Paaji','DP@gmail.com','234.234.8494',sysdate,'IT_PROG',25000,null,100,90);
    commit;
    dbms_output.put_line('Data inserted sucessfully');
end;
/
--select * from employees;
--set serveroutput on;
begin
    insert_emp;
end;
/

-- Create a procedure that updates the salary of an employee based on their EMPLOYEE_ID.

CREATE OR REPLACE PROCEDURE UPDATE_SAL(E_ID IN NUMBER) IS
BEGIN
    UPDATE EMPLOYEES SET SALARY = SALARY + SALARY*10/100 WHERE EMPLOYEE_ID = E_ID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('UPDATED SUCESSFULLY');
    
END;
/
--SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 207;
BEGIN
    UPDATE_SAL(207);
END;
/


--Write a procedure that deletes an employee record based on EMPLOYEE_ID.

CREATE OR REPLACE PROCEDURE DELETE_EMP_REC(EMP_ID IN NUMBER) IS
BEGIN
    DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = EMP_ID;
    DBMS_OUTPUT.PUT_LINE('RECORD SUCESSFULLY DELETED ');
END;
/


BEGIN
    DELETE_EMP_REC(101);
END;
/
--Create a procedure that displays the full name (FIRST_NAME + LAST_NAME) of an employee based on EMAIL.

CREATE OR REPLACE PROCEDURE GET_FULL_NAME1(EMP_MAIL IN EMPLOYEES.EMAIL%TYPE) IS
V_FULL_NAME VARCHAR2(299);
BEGIN
    SELECT FIRST_NAME ||' '||LAST_NAME INTO V_FULL_NAME FROM EMPLOYEES WHERE EMAIL = EMP_MAIL;
    DBMS_OUTPUT.PUT_LINE(V_FULL_NAME);
END;
/
SET SERVEROUTPUT ON;
BEGIN
    GET_FULL_NAME1('SKING');
END;
/

--Write a procedure to fetch and print the job title and hire date of an employee by EMPLOYEE_ID.

CREATE OR REPLACE PROCEDURE GET_JOB_TITLE_HIRE_DATE(EMP_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
IS
V_JOB_ID EMPLOYEES.JOB_ID%TYPE;
V_HIRE_DATE EMPLOYEES.HIRE_DATE%TYPE;
BEGIN
    SELECT JOB_ID,HIRE_DATE INTO V_JOB_ID,V_HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID = EMP_ID;
    DBMS_OUTPUT.PUT_LINE(V_JOB_ID || ' ' ||V_HIRE_DATE);
END;
/
--SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 101;
BEGIN
    GET_JOB_TITLE_HIRE_DATE(101);
END;
/
--SELECT * FROM EMPLOYEES WHERE MANAGER_ID = 201;
-- =============================  Intermediate Level  ====================================

--Create a procedure to give a 10% bonus (add to SALARY) to all employees under a specific MANAGER_ID.

CREATE OR REPLACE PROCEDURE INCREASE_SALARY(M_ID IN EMPLOYEES.MANAGER_ID%TYPE) IS
BEGIN
    UPDATE EMPLOYEES SET SALARY = SALARY + 0.1*SALARY WHERE MANAGER_ID = M_ID;
    COMMIT;
END;

BEGIN
    INCREASE_SALARY(201);
END;
/

--Write a procedure that transfers an employee from one DEPARTMENT_ID to another.

CREATE OR REPLACE PROCEDURE TRANSFER_EMP(EMP_ID IN NUMBER,DEPT_ID IN NUMBER) IS
BEGIN
    UPDATE EMPLOYEES SET DEPARTMENT_ID = DEPT_ID WHERE EMPLOYEE_ID = EMP_ID;
    COMMIT;
END;
/

BEGIN
    TRANSFER_EMP(208,70);
END;

--SELECT * FROM EMPLOYEES;


--Create a procedure to set COMMISSION_PCT to NULL for employees who earn more than 5000 salary.

SELECT * FROM EMPLOYEES;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE SET_COMM_PCT IS
BEGIN
    UPDATE EMPLOYEES
    SET COMMISSION_PCT = 0.23
    WHERE SALARY > 15000;
END;
/

BEGIN
    SET_COMM_PCT;
END;
/


SELECT * FROM EMPLOYEES;


--Write a procedure that counts how many employees are under each JOB_ID and prints them.

CREATE OR REPLACE PROCEDURE COUNT_EMP_UNDER_JOBID IS
BEGIN   
    SELECT JOB_ID,COUNT(*) FROM EMPLOYEES GROUP BY JOB_ID;
END;


--Create a procedure that increases salary by a given percentage for employees hired after a specific date.

-- ================================ Advanced Level   =============================================

--Create a procedure that takes a department ID and returns the average salary of that department.

CREATE OR REPLACE PROCEDURE AVG_DEPT_SAL(DEPT_ID IN NUMBER,AVG_SAL OUT NUMBER) IS
BEGIN
    SELECT AVG(SALARY) INTO AVG_SAL FROM EMPLOYEES WHERE DEPARTMENT_ID = DEPT_ID;

END;

DECLARE
    A NUMBER;
    C NUMBER;
BEGIN
    A := 90;
    AVG_DEPT_SAL(A,C);
    DBMS_OUTPUT.PUT_LINE('AVERAGE SALARY OF THE DEPARTMENT IS : '|| C);
END;

--Write a procedure that promotes an employee (changes JOB_ID and increases SALARY by a percentage).

--Create a procedure that logs fired employees into a separate archive table before deleting them.

--Write a procedure to list all employees who have not been assigned to any manager (MANAGER_ID is NULL).

--Create a procedure that accepts a salary range and lists employees whose salaries fall within that range.

