--**************************************** DDL – Data Definition Language    **********************************************


--How do you create a table named students with columns id, name, and age?

create table std(
id number,
name varchar2(200),
age number
);

select * from std;

drop table std;



--How do you add a new column email to an existing table students?

alter table std add email varchar2(200);



--How do you modify the data type of a column age in a table?

alter table std modify age smallint;

desc std;

--How do you rename a column name to full_name in a table?

alter table std rename column name to full_name;

select * from std;

--How do you drop a column from a table?

alter table std drop column email;

select * from std;

--How do you delete an entire table from the database?

drop table std;


--********************************************************  DML – Data Manipulation Language   *******************************************

--How do you insert a new record into the students table?

INSERT INTO std (id, name, age) VALUES (4, 'David', 22);

select * from std;

--How do you update the age of a student with a specific id?

update std set age = 26 where id = 3;

--How do you delete a student record based on a condition?

delete from std where id = 5;

--****************************************************************   DQL – Data Query Language   ***********************************************


--How do you select all data from a table?

select * from std;

--How do you select specific columns from a table?

select id, name from std;

--How do you use a WHERE clause to filter rows?

select * from std where name like '%BC%';

--How do you sort data in ascending or descending order?

select * from std order by id desc;

--*****************************************************************   Aggregate Functions   *************************************************


--How do you count the total number of rows in a table?

select count(*) as number_of_rows from std;

--How do you find the sum of values in a numeric column?

select sum(age) as sum_of_age from std;

--How do you calculate the average of a column?

select avg(age) as average_age from std;

--How do you find the maximum and minimum values in a column?

select min(age) as mininmum_age , max(age) as maximum_age from std;


--****************************************************************************** GROUP BY and HAVING   *********************************************


--How do you group data by a specific column?

select age,count(age) from std group by age;

--How do you count the number of students in each age group?

select age,count(age) from std group by age order by count(age) desc;

--How do you filter grouped data using the HAVING clause?

select age, count(age) from std group by age having count(age) > 2;


--******************************************************************************** Joins   *****************************************************


--How do you join two tables using INNER JOIN?
DESC EMPLOYEES;
DESC DEPARTMENTS;

SELECT E.*,D.* FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--How do you use LEFT JOIN to include unmatched rows?

SELECT E.*,D.* FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--How do you use RIGHT JOIN and FULL JOIN?

SELECT E.*,D.* FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT E.*,D.* FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--How do you join three or more tables?


SELECT e.employee_id, e.first_name, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;



--********************************************************************* Subqueries and Nested Queries  *****************************************************


--How do you use a subquery in the WHERE clause?

--ex.  2nd highest salary
--select * from employees order by salary desc;
select max(salary) from employees where salary < (select max(salary) from employees);

--How do you find records with values greater than the average?

select salary from employees where salary > (select avg(salary) from employees);

--select avg(salary) from employees;

--How do you use a subquery in the FROM clause?

select * from (select * from departments) d;


--********************************************************************** Constraints and Keys   ************************************************************


--How do you define a primary key while creating a table?


CREATE TABLE NEW_TBL(
EMP_ID NUMBER PRIMARY KEY,
EMP_NAME VARCHAR2(20),
EMP_SAL NUMBER,
EMP_DOB DATE
);

--DROP TABLE NEW_TBL;

--How do you set a default value for a column?

CREATE TABLE NEW_TBL (
    EMP_ID   NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(20),
    EMP_SAL  NUMBER,
    EMP_DOB  DATE,
    STATUS   CHAR(1) DEFAULT 'Y'
);


--How do you add a UNIQUE constraint to a column?


CREATE TABLE tbl (
    emp_id    NUMBER PRIMARY KEY,
    email     VARCHAR2(50) UNIQUE,  -- unique constraint here
    emp_name  VARCHAR2(50)
);


--drop table tbl;
