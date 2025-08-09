------------------------------------   Procedure  ------------------------------------------

create or replace procedure myFirstProc
is
begin
    dbms_output.put_line('hiii');
end;
/
-- We have already created the procedure  Now our task is to execute the procedure

begin
    myFirstProc;
end;
/




-- =======================================================================================================================================================================================
-- =======================================================================    Questions  of Procedure   ==================================================================================
-- =======================================================================================================================================================================================


-- 1)  Write a PL/SQL procedure to print "HELLO WORLD!"

create or replace procedure hello_world is
begin
    dbms_output.put_line('HELLO WORLD!');
end;
begin
    hello_world;
end;
/


-- 2)  Write a PL/SQL procedure to calculate the sum of two numbers.

create or replace procedure sum_two_numbers(a in number , b in number , c out number ) is
begin
    c := a+b;
    dbms_output.put_line(c);
end;
declare
    x number;
    y number;
    ans number;
begin
    x := 19;
    y := 20;
    sum_two_numbers(x,y,ans);
end;
/



-- 3)  Write a PL/SQL procedure to find the maximum of two numbers;

create or replace procedure max_two_number(a in number, b in number , maxi out number) is
begin
    if a > b then 
       maxi := a;
       dbms_output.put_line(' maximum of two number is a:  '|| maxi);
    else
        maxi := b;
        dbms_output.put_line('maximum of two number is b : '|| maxi);
    end if;
end;
declare
    x number;
    y number;
    result number;
begin
    x := 200;
    y := 30;
    max_two_number(x,y,result);
end;
/


-- 4)  Write a PL/SQL procedure to check if a number is even or odd.

create or replace procedure check_even_odd(a in number) is
begin
    if a mod 2 = 0 then 
        dbms_output.put_line(' a is an even number  '|| a);
    else
        dbms_output.put_line('a is an odd number '|| a);
    end if;
end;
begin
    check_even_odd(5);
end;
/


-- 5) Write a PL/SQL procedure to calculate the factorial of a number.
create or replace procedure factorial(num in number , result out number) is
    fact number := 1;
begin
    for i in 1..num loop
        fact := fact*i;
    end loop;
    result := fact;
end;
declare
    a number;
    b number;
begin
    a := 5;
    factorial(a,b);
    dbms_output.put_line(b);
end;
/


-- 6) Write a PL/SQL procedure to reverse a string.

create or replace procedure reverse_string(input_str in varchar2, output_str out varchar2) is
begin
    for i in reverse 1..length(input_str) loop
        output_str := output_str || substr(input_str,i,1);
    end loop;
end;
declare
    str1 varchar2(50);
    ans varchar2(50);
begin
    str1 := 'Srikant';
    reverse_string(str1,ans);
    dbms_output.put_line(ans);
end;
/


-- 7) Write a PL/SQL procedure to find the length of a string.

create or replace procedure str_length(input_str in varchar2, length_string out number) is
begin
    length_string := length(input_str);
end;
declare
    input_str varchar2(50);
    length_string number;
begin
    input_str := 'srikant';
    str_length(input_str,length_string);
    dbms_output.put_line(length_string);
end;
/
-- 8) Write a PL/SQL procedure to check if a number is prime.

create or replace procedure check_prime(num in number, is_prime out varchar2) is
    cnt number := 0;
begin
    if num <= 1 then
        is_prime := 'NO';
    else
        for i in 2..floor(sqrt(num)) loop
            if mod(num,i) = 0 then
                cnt := cnt + 1;
            end if;
        end loop;
        if cnt = 0 then
            is_prime := 'YES';
        else
            is_prime := 'NO';
        end if;
    end if;
end;
declare
    num1 number;
    ans varchar2(20);
begin
    num1 := 20;
    check_prime(num1,ans);
    dbms_output.put_line(ans);
end;
/
-- 9) Write a PL/SQL procedure to find the GCD of two numbers.
CREATE OR REPLACE PROCEDURE gcd_two_numbers(p IN NUMBER, b IN NUMBER, gcd_val OUT NUMBER) IS
    p_local NUMBER := p;
    b_local NUMBER := b;
BEGIN
    WHILE b_local != 0 LOOP
        gcd_val := b_local;
        b_local := MOD(p_local, b_local);
        p_local := gcd_val;
    END LOOP;
    gcd_val := p_local;
END;
declare
    x number;
    y number;
    z number;
begin
    x := 5;
    y := 10;
    gcd_two_numbers(x,y,z);
    dbms_output.put_line('GCD of number '|| x ||' and number '|| y ||' Is :  '|| z);
end;
/

-- 10) Write a PL/SQL procedure to swap two numbers.

create or replace procedure swap_two_numbers(a in out number , b in out number) is
    temp number;
begin
    temp := a;
    a := b;
    b := temp;
end;
declare
    x number;
    y number;
begin
    x := 10;
    y := 20;
    dbms_output.put_line('Initial numbers are x :  '|| x ||' and y : '|| y);
    swap_two_numbers(x,y);
    dbms_output.put_line('After Swaping numbers the output is x:  '|| x || ' and y:  '||y);
end;
/


-- ===========================================================================================================
----------------------------------------   Procedure Question using table  ----------------------------
-- ======================================================================================================
select * from emp;

-- 1. Write a procedure to insert a new employee into the employees table.

create or replace procedure insert_emp(p_empno in number, p_ename in varchar,p_job in varchar,p_mgr in number,p_hiredate in date,p_sal in number, p_comm in number, p_deptno in number) is
begin
    insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values(p_empno,p_ename,p_job,p_mgr,p_hiredate,p_sal,p_comm,p_deptno);
end;
BEGIN
    insert_emp(7671, 'PL/SQL', 'HR', 7839, TO_DATE('05/05/2003', 'DD/MM/YYYY'), 8000, 2, 20);
END;
/

-- 2. Write a procedure to update an employee's salary in the employees table.

create or replace procedure update_sal(p_empno in number,p_salary in number) is
begin
    update emp set sal = p_salary where empno = p_empno;
end;
begin
    update_sal(7671,18000);
end;
/

-- 3. Write a procedure to delete an employee from the employees table by employee ID.

create or replace procedure delete_emp(p_empid in number) is
begin
    delete from emp where empno = p_empid;
end;
begin
    delete_emp(7671);
    dbms_output.put_line('Employee Sucessfully Deleted ');
end;
/
-- 4. Write a procedure to increase the salary of all employees by a given percentage.

create or replace procedure salary_increment(percentage in number) is
begin
    update emp set sal = sal + (sal*percentage / 100);
end;
begin
    salary_increment(50);
end;
/
-- 5. Write a procedure to find and display the details of an employee by employee ID.
create or replace procedure display_details(p_empid in number) is
p_name emp.ename%type;
p_sal emp.sal%type;
begin
    select ename,sal into p_name,p_sal from emp where empno = p_empid;
    dbms_output.put_line(p_name || ' and salary is '||p_sal);
    exception
        when no_data_found then
            dbms_output.put_line('Employee not found ');
end;
begin 
    display_details(7782);
end;
/
-- 6. Write a procedure to insert multiple employees into the employees table using a cursor.
-- 7. Write a procedure to transfer an employee to a new department.

create or replace procedure transfer_emp(p_empid in number) is
begin
    update emp set job = 'POLICE' where empno = p_empid;
end;
begin
    transfer_emp(7839);
end;
/
-- 8. Write a procedure to calculate the total salary of all employees in a specific department.

create or replace procedure calculate_salary(p_dept in varchar2,count_total_salary out number) is
begin
    -- dbms_output.put_line(p_dept);
    select sum(sal) into count_total_salary from emp where job = p_dept;
    -- dbms_output.put_line(count_total_salary);
end;
declare
    department varchar2(50);
    total_salary number;
begin
    department := 'MANAGER';
    calculate_salary(department,total_salary);
    dbms_output.put_line('Total salary for the Department '|| department || ' is '|| total_salary);
end;
/
-- 9. Write a procedure to display the details of all employees in a specific department.
create or replace procedure all_emp_with_dept(dept in varchar2) is
id emp.empno%type;
name emp.ename%type;
job1 emp.job%type;
salary emp.sal%type;
begin
    select empno,ename,job,sal into id,name,job1,salary from emp where job = dept;
    dbms_output.put_line('emp id: '|| id ||' name: '||name||' job : '||job1||' salary: '||salary);
end;
begin
    all_emp_with_dept('POLICE');
end;
/
-- 10. Write a procedure to give a bonus to all employees who have been with the company for more than 5 years.

create or replace procedure bonus_to_all(bonus in number) is
begin
    update emp set sal = sal +(sal*bonus/100);
end;
begin
    bonus_to_all(10);
end;
/