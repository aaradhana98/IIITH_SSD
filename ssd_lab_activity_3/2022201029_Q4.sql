select d.Dnumber, d.Dname, count(dept.Dlocation)
from DEPARTMENT d, DEPT_LOCATIONS dept
where d.Dnumber=dept.Dnumber and d.Mgr_ssn in (select b.Essn from DEPARTMENT a, DEPENDENT b where a.Mgr_ssn=b.Essn and b.Sex='F' group by b.Essn having count(*)>=2)
group by Dnumber;
