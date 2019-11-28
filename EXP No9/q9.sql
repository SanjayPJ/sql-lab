create or replace function avgsal() return number is
sal number(10);
begin
select avg(salary) into sal from employee;
return sal;
end;