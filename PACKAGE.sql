

--What is a Package in PL/SQL?
--A package has two parts:
--
--Specification (PACKAGE) – the interface (what is available publicly).
--
--Body (PACKAGE BODY) – the implementation (actual code).


--=================================================================================================================
--Example: Simple Employee Utility Package
--We’ll create a package that includes:
--
--A procedure to display an employee's full name.
--
--A function to calculate yearly salary.


--***************************************************     Package Specification   ********************************************

CREATE OR REPLACE PACKAGE EMP_UTIL_PKG AS

    PROCEDURE GET_FULLNAME(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE);
    FUNCTION GET_ANNUAL_SALARY(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
        RETURN NUMBER;

END EMP_UTIL_PKG;
/


--*****************************************************      Package Body        ***********************************************


CREATE OR REPLACE PACKAGE BODY EMP_UTIL_PKG AS

        PROCEDURE GET_FULLNAME(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE) IS
        V_FNAME EMPLOYEES.FIRST_NAME%TYPE;
        V_LNAME EMPLOYEES.LAST_NAME%TYPE;
        
        BEGIN
            SELECT FIRST_NAME,LAST_NAME INTO V_FNAME,V_LNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = E_ID;
            DBMS_OUTPUT.PUT_LINE('FULL NAME OF THE EMPLOYEE IS : ' || V_FNAME || ' '||V_LNAME);
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('EMPLOYEE NOT FOUND  ');
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('THERE ARE SOME ERRORS');
        END GET_FULLNAME;
        
        
        
        FUNCTION GET_ANNUAL_SALARY(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
        RETURN NUMBER IS
        GET_ANNUAL_SAL NUMBER;
        BEGIN
            SELECT SALARY INTO GET_ANNUAL_SAL FROM EMPLOYEES WHERE EMPLOYEE_ID = E_ID;
            RETURN GET_ANNUAL_SAL*12;
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                    RETURN 0;
                WHEN OTHERS THEN
                    RETURN NULL;
        END GET_ANNUAL_SALARY;
            
END EMP_UTIL_PKG;
/



--******************************************************     How to Use the Package:     *****************************************



SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
BEGIN
    EMP_UTIL_PKG.GET_FULLNAME(100);
END;
/

DECLARE
    V_ANAL NUMBER;
BEGIN
    V_ANAL := EMP_UTIL_PKG.GET_ANNUAL_SALARY(100);
    DBMS_OUTPUT.PUT_LINE('YEARLY SALARY OF THIS EMPLOYEE IS : '||V_ANAL);
END;
/



--========================================================================================================================================================



--Certainly, master! Here's another complete example of a PL/SQL package for your EMPLOYEES table. This one will include:
--
--A procedure to update salary by percentage.
--
--A function to get employee email by ID.
--
--A procedure to delete an employee record.



--PACKAGE: employee_pkg



--1. Package Specification

DROP PACKAGE EMPLOYEE_PKG;

CREATE OR REPLACE PACKAGE EMPLOYEE_PKG AS

    PROCEDURE UPDATE_SALARY(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE,PERCENTAGE IN NUMBER);
    
    FUNCTION GET_EMPLOYEE_EMAIL(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
        RETURN VARCHAR2;
    
    PROCEDURE DELETE_EMPLOYEE_RECORD(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE);
    
END EMPLOYEE_PKG;
/




--*******************************************    Package Body     *******************************************



CREATE OR REPLACE PACKAGE BODY EMPLOYEE_PKG AS

    PROCEDURE UPDATE_SALARY(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE, PERCENTAGE IN NUMBER) IS
    BEGIN
        UPDATE EMPLOYEES SET SALARY = SALARY + SALARY*PERCENTAGE/100 WHERE EMPLOYEE_ID = E_ID;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('NO RECORD FOUND FOR THIS EMPLOYEE ID:');
            WHEN OTHERS THEN 
                DBMS_OUTPUT.PUT_LINE('ERROR');
    END UPDATE_SALARY;
    
    
    
    FUNCTION GET_EMPLOYEE_EMAIL(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN VARCHAR2 IS
    V_EMAIL EMPLOYEES.EMAIL%TYPE;
    BEGIN
        SELECT EMAIL INTO V_EMAIL FROM EMPLOYEES WHERE EMPLOYEE_ID = E_ID;
        RETURN V_EMAIL;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                RETURN 'NO DATA FOUND';
            WHEN OTHERS THEN
                RETURN NULL;
    END GET_EMPLOYEE_EMAIL;
    
    
    
    PROCEDURE DELETE_EMPLOYEE_RECORD(E_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE) IS
    BEGIN
        DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = E_ID;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('NO SUCH RECORD FOUND FOR THIS EMPLOYEE ID');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('ERROR!!!');
    END DELETE_EMPLOYEE_RECORD;
    
     
END EMPLOYEE_PKG;
/



--******************************************************     How to Use the Package:     *****************************************

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 207;
BEGIN
    EMPLOYEE_PKG.UPDATE_SALARY(100,0);
END;
/


DECLARE
    V_MAIL EMPLOYEES.EMAIL%TYPE;
BEGIN
    V_MAIL := EMPLOYEE_PKG.GET_EMPLOYEE_EMAIL(100);
    DBMS_OUTPUT.PUT_LINE('EMAIL ADDRESS OF THE EMPLOYEE IS : '||V_MAIL);
END;
/


BEGIN
    EMPLOYEE_PKG.DELETE_EMPLOYEE_RECORD(207);
END;
/