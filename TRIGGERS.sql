


----------------------------------------------------   BEFORE INSERT
CREATE OR REPLACE TRIGGER SET_HIRE_DATE
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN
    IF :NEW.HIRE_DATE IS NULL THEN
        :NEW.HIRE_DATE := SYSDATE;
    END IF;
END;
/
----------------------------------------------------   AFTER INSERT

CREATE OR REPLACE TRIGGER AFTER_EMPLOYEE_INSERT
AFTER INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:NEW.FIRST_NAME || ' - ' || :NEW.LAST_NAME);
END;
/


------------------------------------------------------   BEFORE UPDATE

CREATE OR REPLACE TRIGGER prevent_salary_decrease
BEFORE UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
    IF :NEW.SALARY < :OLD.SALARY THEN
        RAISE_APPLICATION_ERROR(-20001,'NEW SALARY SHOULD NOT BE LESS THAN THE OLD SALARY');
    END IF;
END;
/

---------------------------------------------------------   AFTER DELETE TRIGGER
-- First, create a log table
CREATE TABLE deleted_employees_log (
    employee_id NUMBER,
    deleted_at DATE
);

-- Now, the trigger
CREATE OR REPLACE TRIGGER log_deleted_employee
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees_log (employee_id, deleted_at)
    VALUES (:OLD.employee_id, SYSDATE);
END;
/








INSERT INTO employees (
    employee_id, first_name, last_name, email, phone_number,
    job_id, salary, commission_pct, manager_id, department_id
) VALUES (
    207, 'Aman', 'Kumar', 'aman.kumar@example.com', '1234567890',
    'IT_PROG', 50000, NULL, 101, 60
);

DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = 207;
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 207; 
UPDATE EMPLOYEES SET SALARY = 4535 WHERE EMPLOYEE_ID = 207;




DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = 207;

SELECT * FROM DELETED_EMPLOYEES_LOG;



