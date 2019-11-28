	
Question 1

CREATE OR REPLACE TRIGGER del 
BEFORE DELETE ON sh_project FOR EACH ROW

BEGIN
 
	RAISE_APPLICATION_ERROR   (-20999  ,'DELETION NOT ALLOWED' );

END;
/

Question 2

CREATE OR REPLACE TRIGGER upd 
BEFORE UPDATE ON sh_emp REFERENCING NEW AS N OLD AS O
FOR EACH ROW
WHEN (N.salary < O.salary)
BEGIN
 
	RAISE_APPLICATION_ERROR   (-20999  ,'UPDATION NOT ALLOWED' );

END;
/

Question 3

CREATE OR REPLACE TRIGGER del2
BEFORE
DELETE ON sh_emp
REFERENCING OLD AS O FOR EACH ROW WHEN(O.AGE<60)

BEGIN

	RAISE_APPLICATION_ERROR (-20999  ,'DELETION NOT ALLOWED');

END;
/

Question 4


CREATE OR REPLACE TRIGGER ins
BEFORE
INSERT ON sh_emp
REFERENCING NEW AS N FOR EACH ROW WHEN(N.CITY!='KLM')

BEGIN

	RAISE_APPLICATION_ERROR (-20999  ,'INSERTION NOT ALLOWED');

END;
/
INSERT INTO sh_emp VALUES('E3','RINA','MANAGER','F',45,10000,'05,JAN,1999','P4','LONDON');