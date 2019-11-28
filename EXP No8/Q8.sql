Q1-
create or replace procedure maxsal(id int) 
is
sal employee.salary%type;
begin
select salary into sal from employee where salary=(select max(salary) from employee e,project1 p where e.projectno=p.pno);
dbms_output.put_line(sal);
end;
/

