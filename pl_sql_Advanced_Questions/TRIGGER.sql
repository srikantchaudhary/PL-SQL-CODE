--******************************************   TRIGGERS  ******************************************


--=======================================  Basic   ============================================
--Write a trigger that prints a message whenever a new employee is inserted.
--
--Write a trigger that prevents deletion of any department.
--
--Create a trigger that logs the old and new salary whenever an employee's salary is updated.
--
--Write a trigger that prevents insertion of an employee with salary less than 5000.
--
--Create a trigger that sets COMMISSION_PCT to 0 if it is NULL on insert.

--======================================= Medium   =========================================

--Write a trigger that automatically updates the MANAGER_ID of an employee to a default value if it's NULL.
--
--Create a trigger that updates a log table when a department is updated.
--
--Write a trigger that ensures no two employees can have the same email.
--
--Create a trigger that updates another column called LAST_UPDATED_DATE when salary is updated.
--
--Write a trigger to prevent hiring employees on Sundays.

--=====================================    Hard   ===========================================

--Write a trigger that raises an error if the total salary of a department exceeds 1,000,000 after an insert or update.
--
--Create a trigger that keeps track of salary history in a separate table whenever salary is updated.
--
--Write a trigger to prevent insertion of employees into departments that do not exist.
--
--Create a compound trigger to log changes made in EMPLOYEES during a transaction.
--
--Write a trigger that validates COMMISSION_PCT does not exceed 20% of SALARY.

