Question 1

declare
	empno sh_emp.eno %type;
	cursor salCd is
		select eno from sh_emp where salary > 5000;
begin
	open salCd;
	loop
		fetch salCd into empno ;
		update sh_emp set city = 'LONDON' where eno = empno;
		exit when salCd %notfound;
	end loop;
	close salCd;
end;
/	

Question 2 

declare
	cursor c is
		select extract(month from DOJ),avg(salary) from sh_emp group by extract(month from DOJ);
	mon varchar(4);
	cnt int;
begin
	open c;
	loop
		fetch c into mon,cnt ;
		dbms_output.put_line(mon || '-' || cnt );
		exit when c %notfound;
	end loop;
	close c;
end;
/
		
