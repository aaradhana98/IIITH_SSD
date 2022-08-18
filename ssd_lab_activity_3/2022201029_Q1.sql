select distinct CONCAT(e.Fname," ",e.Minit," ",e.Lname) as Fullname, d.Dnumber, d.Dname
from EMPLOYEE e, DEPARTMENT d, WORKS_ON w, PROJECT p
where e.Ssn=d.Mgr_ssn and w.Pno=p.Pnumber and p.Dnum=d.Dnumber and w.Essn in (select w.Essn 
																		      from WORKS_ON w, DEPARTMENT d, PROJECT p
																			  where w.Pno=p.Pnumber and p.Dnum=d.Dnumber and w.Hours<40.0 and w.Essn not in (select Mgr_ssn from DEPARTMENT));
