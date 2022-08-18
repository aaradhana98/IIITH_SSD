select d.Mgr_ssn as "Manager ssn", count(w.Essn) as "Number of projects"
from DEPARTMENT d, PROJECT p, WORKS_ON w
where p.Dnum=d.Dnumber and p.Pname="ProductY" and w.Essn=d.Mgr_ssn;
