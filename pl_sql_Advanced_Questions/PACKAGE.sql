--**********************************************************  PACKAGES  **************************************************



--********************************************* Basic Level  ****************************************************




--Create a package specification with a procedure that prints all employee names.

-- Package Specification

CREATE OR REPLACE PACKAGE emp_pkg AS 
    PROCEDURE print_all_employee_names;
END emp_pkg;
/

--  Package Body

CREATE OR REPLACE PACKAGE BODY emp_pkg AS
    PROCEDURE print_all_employee_names IS 
    BEGIN
        FOR rec IN (SELECT FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME
                        FROM employees) LOOP
            DBMS_OUTPUT.PUT_LINE(rec.FULL_NAME);
        END LOOP;
    END print_all_employee_names;
END emp_pkg;
/

-- Enable DBMS_OUTPUT

SET SERVEROUTPUT ON;

--  Execute the procedure

BEGIN
    emp_pkg.print_all_employee_names;
END;
/

Create a package with a function to return total number of employees in a department.

Create a package with a constant value for minimum salary and use it in a procedure.

Create a package that has a procedure to insert a new department.

Write a package with a procedure that prints employee full name based on EMPLOYEE_ID.



--***************************************************   Medium Level   ***********************************************************


Create a package with a private procedure and a public function that uses it internally.

Create a package with an overloaded procedure add_employee (one with full data, one with only mandatory).

Create a package with a procedure to increase salary by department ID and a given percentage.

Write a package to validate employee email format and store it only if valid.

Create a package to log changes made to the EMPLOYEES table into an audit table.




--**********************************************************   Hard Level   **********************************************************



Create a package that maintains an in-memory global variable (like TOTAL_EMP_COUNT) and updates it on procedure call.

Write a package with a cursor to fetch and return employees of a department, and a function that uses it.

Create a package that performs bulk insert/update for multiple employees using collections.

Write a package to track and report the number of operations (insert/update/delete) done in a session.

Create a package that uses an exception-handling subprogram to catch and log all errors into an error_log table.

