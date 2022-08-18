select d.Mgr_ssn, d.Dnumber, count(x.Essn)
from DEPARTMENT d, DEPT_LOCATIONS dept, DEPENDENT x
where d.Mgr_ssn=x.Essn and d.Dnumber=dept.Dnumber and d.Dnumber in (select Dnumber from DEPT_LOCATIONS group by Dnumber having count(*)>=2)
group by d.Mgr_ssn, d.Dnumber;
