set serveroutput on

DECLARE
	n number;
	r number;
BEGIN
	n:=&t;
	r:= MOD(n, 2); 
    IF r = 0 THEN
      dbms_output.put_line('Even'); 
    ELSE
      dbms_output.put_line('Odd'); 
    END IF; 
END;
/

Question 1 

DECLARE
	r number;
	pi number := 3.14;
BEGIN
	r:=&radius;
	dbms_output.put_line(r * r * pi);
END;
/
Question 2

declare
	empid sh_emp.eno %type;
	sal sh_emp.salary %type;
begin
	empid := &empno;
	select salary into sal from sh_emp where empid = eno;
	if sal < 5000 then
		update sh_emp set salary = (0.5 * salary ) where eno = empid;
	elsif sal < 10000 then 
		update sh_emp set salary = (0.1 * salary ) where eno = empid;
	else 
		dbms_output.put_line('No INCREMENT');
	end if;
end;
/

Question 3

declare	
	name sh_emp.ename %type;
	sal sh_emp.salary %type;
	dep sh_dep.dname %type;
	project sh_project.pname %type;
	age sh_emp.age %type;
begin
	name := &empName;
	select e.salary,e.age,d.dname,p.pname into sal,age,dep,project from sh_emp e,sh_project p,sh_dep d where e.pno = p.pno and p.dno = d.dno and e.ename = name;
	dbms_output.put_line(name);
	dbms_output.put_line(age); 
	dbms_output.put_line(sal);
	dbms_output.put_line(dep);
	dbms_output.put_line(project);
end;
/

Question 4

declare 
	empno sh_emp.eno %type;
	age sh_emp.age %type;
x exception;
begin
	empno := &empno;
	select e.age into age from sh_emp e where e.eno = empno;
	if age > 60 then
		raise x;
	end if;
exception 
	when x then
		dbms_output.put_line('age exception');
end;
/

