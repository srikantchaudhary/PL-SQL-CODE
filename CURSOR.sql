

---------------------------------------   CURSORS – 10 with Answers   -------------------------------------------------

select * from employees;

--   Q1. Simple cursor to fetch all employees

set serveroutput on;

declare
    cursor emp_cursor is select employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary from employees;
    
    v_eid employees.employee_id%type;
    v_fname employees.first_name%type;
    v_lname employees.last_name%type;
    v_email employees.email%type;
    v_phno employees.phone_number%type;
    v_hiredate employees.hire_date%type;
    v_jobid employees.job_id%type;
    v_salary employees.salary%type;

begin
    open emp_cursor;
        loop
            fetch emp_cursor into v_eid,v_fname,v_lname,v_email,v_phno,v_hiredate,v_jobid,v_salary;
            exit when emp_cursor%notfound;
            dbms_output.put_line(v_eid || ' ' || v_fname || ' ' || v_lname || ' '|| v_email || ' '||v_phno|| ' '||v_hiredate||' '|| v_jobid || ' '||v_salary);
        end loop;
    close emp_cursor;
end;
/

--   Q2. Cursor with parameters
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 90;



DECLARE
    CURSOR EMP_PRAM(DEPT IN NUMBER) IS SELECT EMPLOYEE_ID,FIRST_NAME,EMAIL,JOB_ID,SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = DEPT;
    
    v_eid employees.employee_id%type;
    v_fname employees.first_name%type;
    v_email employees.email%type;
    v_jobid employees.job_id%type;
    v_salary employees.salary%type;
BEGIN
    OPEN EMP_PRAM(90);
        LOOP
            FETCH EMP_PRAM INTO V_EID,V_FNAME,V_EMAIL,V_JOBID,V_SALARY;
            EXIT WHEN EMP_PRAM%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('---------------------------------------');
            DBMS_OUTPUT.PUT_LINE(V_EID);
            DBMS_OUTPUT.PUT_LINE(V_FNAME);
            DBMS_OUTPUT.PUT_LINE(V_EMAIL);
            DBMS_OUTPUT.PUT_LINE(V_JOBID);
            DBMS_OUTPUT.PUT_LINE(V_SALARY);
        END LOOP;
    CLOSE EMP_PRAM;
END;
/

--   Q3. Cursor FOR LOOP

DECLARE
    TOTAL_SALARY NUMBER := 0;
BEGIN
    FOR EMP_RECORD IN (SELECT SALARY FROM EMPLOYEES)
    LOOP
        TOTAL_SALARY := TOTAL_SALARY + EMP_RECORD.SALARY;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('TOTAL SALARY OF ALL EMPLOYEES IS : '||TOTAL_SALARY);
END;
/




--   Q4. Cursor to calculate total salary

--select sum(salary) from employees;
--select * from employees;

--set serveroutput on;
DECLARE
    CURSOR CAL_SAL IS SELECT SALARY FROM EMPLOYEES;
    V_TOTAL_SAL EMPLOYEES.SALARY%TYPE := 0;
    V_SAL EMPLOYEES.SALARY%TYPE;
    
BEGIN

    OPEN CAL_SAL;
        LOOP
            FETCH CAL_SAL INTO V_SAL;
            EXIT WHEN CAL_SAL%NOTFOUND;
            V_TOTAL_SAL := V_TOTAL_SAL + V_SAL;
            
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(V_TOTAL_SAL);
    CLOSE CAL_SAL;
END;
/