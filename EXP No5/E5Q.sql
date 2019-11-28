1-select count(eno) from SH_emp where pno not in (select pno from SH_emp where ename in ('amal','rohith'));

2-select count(eno) from SH_emp where salary>(select avg(salary) from SH_emp);

3-select * from SH_project where pno=(select pno from SH_emp where salary=(select max(salary) from SH_emp));

4-select dname from SH_dep natural join SH_project where pno=(select pno from SH_emp where age in(select min(age) from SH_emp));

/*5-select * from SH_emp where eno in (select eno from (select eno,extract(month from DOJ) as mon from SH_emp) where mon=3); */

5-select * from SH_emp where DOJ like '__-MAR-__';

6-select mon from (select extract(month from doj) as mon,count(extract(month from doj)) as cnt from sh_emp group by extract(month from doj)) where cnt 
	= (select max(count(extract(month from doj))) as cnt from sh_emp group by extract(month from doj));

7-update sh_emp set salary = (0.1*salary) where age = ( select max(age) from sh_emp); 

8-select * from sh_emp where doj like '__-SEP-__' and salary > (select avg(salary) from sh_emp); 

9-select * from sh_emp where pno not in (select pno from sh_emp where ename = 'amal');

10-select * from sh_emp where pno = (select pno from sh_dep where dno =(select dno from sh_dep where dname = 'CSE')) order by ename;

11-create view empAge3040 as select * from sh_emp where age between 30 and 40;

12-create view view2 as select e.eno,e.ename,e.pno,d.dname from sh_emp e,sh_dep d,sh_project p where e.pno = p.pno and p.dno = d.dno; 


"""
create view mons as select extract(month from DOJ) as mon from SH_emp;

select mon from mons where mon=(select max(mon) from (select count(mon) from mons group by mon) );

select max(select count(mon) from mons group by mon) from mons;

select extract(month from doj) as mon, count(extract(month from doj)) as cnt from sh_emp group by extract(month from doj);


select max(cnt) from (select extract(month from doj) as mon,count(extract(month from doj)) as cnt from sh_emp group by extract(month from doj));

select max(count(extract(month from doj))) as cnt from sh_emp group by extract(month from doj);

select mon from (select extract(month from doj) as mon,count(extract(month from doj)) as cnt from sh_emp group by extract(month from doj)) where cnt = (select max(count(extract(month from doj))) as cnt from sh_emp group by extract(month from doj));


select count(*) from employee where projectno not in(select projectno from employee where empname in('RAJ','ARUN'));

select count(*) from employee where salary>(select avg(salary) from employee);

select * from project1 where pno=(select projectno from employee where salary=(select max(salary) from employee));

select deptname from employee e,project1 p,department d where e.projectno=p.pno and p.deptno=d.deptno and empno =(select empno from employee where age=(select min(age) from employee));

select * from employee where doj like '__-JAN-__';

6##(select extract(month from doj) as m,count(*) from employee group by doj);

update employee set salary=salary + salary*.10 where age=(select max(age) from employee);

			     extract(month from doj)    
select * from employee where to_char(doj,'Mon')='Apr' and salary >(select avg(salary) from employee);

select * from employee e,project1 p where e.projectno=p.pno and pno !=(select projectno from employee where empname='SAM');


select * from employee e, project1 p where e.projectno=p.pno and deptno =(select deptno from department where deptname='CSE');

create view VIEW3040 as select * from employee where age between 30 and 40;

create view EMPVIEW as select deptname,empname,projectno,empno from employee e, project1 p,department d  where e.projectno=p.pno and p.deptno=d.deptno;
"""