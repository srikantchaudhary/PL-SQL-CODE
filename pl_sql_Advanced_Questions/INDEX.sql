-- ******************************************  INDEXES  *******************************************
 
 
--=======================================   Basic   ============================================

--Create an index on the EMAIL column of EMPLOYEES table.

--Create a unique index on EMPLOYEE_ID.

--Create a composite index on (LAST_NAME, FIRST_NAME).

--Show how to drop an index.

--Create a function-based index on UPPER(LAST_NAME).

--===================================   Medium  =============================================

--Analyze performance with and without index on SALARY.

--Create a bitmap index on DEPARTMENT_ID.

--Create a descending index on HIRE_DATE.

--Create a unique composite index on EMAIL and PHONE_NUMBER.

--Create an index to improve join performance between EMPLOYEES and DEPARTMENTS.

--======================================   Hard  ===========================================

--Create a partitioned index based on SALARY ranges.

--Monitor index usage and identify unused indexes.

--Create a reverse key index on PHONE_NUMBER.

--Create a domain index for a text column (if any).

--Implement indexing strategy for a report-heavy system with multiple joins and filters.