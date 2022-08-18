select distinct CONCAT(e.Fname," ",e.Minit," ",e.Lname) as Fullname, e.Ssn, e.Dno
from EMPLOYEE e
where e.Ssn in (select Super_ssn from EMPLOYEE);
