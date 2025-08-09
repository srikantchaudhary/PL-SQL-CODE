-- 1. Write a PL/SQL function to return "Hello, World!".

create or replace function hello_world1 return varchar2 is
begin
    return 'hello world!';
end;
/
declare
    res varchar2(50);
begin
    res := hello_world1;
    dbms_output.put_line(res);
end;
/

SET SERVEROUTPUT ON;

-- 2. Write a PL/SQL function to calculate the sum of two numbers.

create or replace function two_sum(a number, b number) 
return number is
begin
    return a+b;
end;
/
declare 
    a number;
    b number;
    c number;
begin
    a := 10;
    b := 23;
    c := two_sum(a,b);
    dbms_output.put_line(c);
end;
/
-- 3. Write a PL/SQL function to find the maximum of two numbers.

create or replace function max_in_two(a number, b number)
return number is
begin 
    if a > b then
        return a;
    else
        return b;
    end if;
end;
/
declare
    x number;
    y number;
    ans number;
begin
    x := 19;
    y := 23;
    ans := max_in_two(x,y);
    dbms_output.put_line(ans);
end;
/
-- 4. Write a PL/SQL function to check if a number is even.

create or replace function even_odd(a number)
return varchar2 is
begin
    if mod(a,2) = 0 then
        return 'Even';
    else
        return 'Odd';
    end if;
end;
declare
    ans varchar2(20);
begin
    ans := even_odd(50);
    dbms_output.put_line(ans);
end;
/
-- 5. Write a PL/SQL function to calculate the factorial of a number.

create or replace function factorial1(a number) 
return number is
fact1 number := 1;
begin
    if a = 0 then
        return 1;
    else
        for i in 1..a loop
            fact1 := fact1*i;
        end loop;
        return fact1;
    end if;
end;
declare
    ans number;
begin
    ans := factorial1(6);
    dbms_output.put_line(ans);
end;
/
-- 6. Write a PL/SQL function to reverse a string.

create or replace function rev_string(str varchar2)
return varchar2 is
res varchar2(50);
begin
    for i in reverse 1..length(str) loop
        res := res || substr(str,i,1);
    end loop;
    return res;
end;
declare
    str1 varchar2(50);
begin
   str1 :=  rev_string('hello srikant');
   dbms_output.put_line(str1);
end;
/


-- 7. Write a PL/SQL function to find the length of a string.
-- 8. Write a PL/SQL function to check if a number is prime.
-- 9. Write a PL/SQL function to find the GCD of two numbers.
-- 10. Write a PL/SQL function to swap two numbers.

-- ===========================================================================================================
----------------------------------------   Function Question using table  ----------------------------
-- ======================================================================================================

-- 1. Write a function to get the salary of an employee by employee ID.

create or replace function get_salary(empid number)
return number is
salary emp.sal%type;
begin
    select sal into salary from emp where empno = empid;
    return salary;
end;
declare
    id emp.empno%type;
    salary emp.sal%type;
begin
    id := 7839;
    salary := get_salary(id);
    dbms_output.put_line(salary);
end;
/
-- 2. Write a function to calculate the annual salary of an employee.

create or replace function annual_salary(empid number)
return number is
annual_salary emp.sal%type;
begin
    select sal*12 into annual_salary from emp where empno = empid;
    return annual_salary;
end;
declare
    id emp.empno%type;
    package number;
begin
    id := 7839;
    package := annual_salary(id);
    dbms_output.put_line(package);
end;
/

-- 3. Write a function to get the full name of an employee.


create or replace function full_name(empid number)
return varchar2 is
name varchar2(50);
job1 varchar2(50);
begin
    select ename,job into name,job1 from emp where empno = empid;
    return name|| ' , ' || job1;
end;
declare
    name varchar2(50);
begin   
    name := full_name(7499);
    dbms_output.put_line(name);
end;
/
-- 4. Write a function to check if an employee exists by employee ID.

create or replace function emp_exist(e_empid number) 
return varchar2 is
val number;
e_user varchar2(50);

begin
    select count(empno) into val from emp where empno = e_empid;
    if val > 0 then
        return 'Yes User is Present ';
    else 
        return 'With this Id There is No User ';
    end if;
end;
declare
    res varchar2(50);
begin
    res := emp_exist(7843);
    dbms_output.put_line(res);
end;
/
-- 5. Write a function to calculate the average salary of all employees.

create or replace function avg_salary(empid number)
return number is
avg_sal number;
begin
    select sum(sal)/count(empno) into avg_sal from emp;
    return avg_sal;
end;
declare 
    total_avg_sal number;
begin
    total_avg_sal := avg_salary(7842);
    dbms_output.put_line(total_avg_sal);
end;
/
-- 6. Write a function to get the department name by department ID.
-- 7. Write a function to calculate the total salary of a specific department.


create or replace function get_totalSalary_of_department(e_dept varchar2)
return number is
total_salary number;
begin
    select sum(sal) into total_salary from emp where job = e_dept;
    return total_salary;
end;
declare
    dept varchar2(50);
    salary number;
begin
    dept := 'MANAGER';
    salary := get_totalSalary_of_department(dept);
    dbms_output.put_line(salary);
end;
/
-- 8. Write a function to get the highest salary in the employees table.


create or replace function get_max_sal(empid number)
return number is
max_sal number;
begin
    select max(sal) into max_sal from emp;
    return max_sal;
end;
declare
    max_salary number;
begin
    max_salary := get_max_sal(7842);
    dbms_output.put_line(max_salary);
end;
/
-- 9. Write a function to get the number of employees in a specific department.

create or replace function get_number_of_employess(e_dept varchar2)
return number is 
total_user number;
begin
    select count(empno) into total_user from emp where job = e_dept;
    return total_user;
end;
declare 
    total_nubmer_of_user number;
begin
    total_nubmer_of_user := get_number_of_employess('MANAGER');
    dbms_output.put_line(total_nubmer_of_user);
end;
/



-- 10. Write a function to get the email of an employee by employee ID.

create or replace function get_email(e_empid number)
return varchar2 is
name1 varchar2(50);
begin
    select ename into name1 from emp where empno = e_empid;
    return name1;
end;
declare
    name2 varchar2(50);
begin
    name2 := get_email(7842);
    dbms_output.put_line(name2);
end;
/
