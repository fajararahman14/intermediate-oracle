SELECT emp.ename, dept.deptno, dept.dname FROM emp, dept 
    WHERE dept.deptno = emp.deptno;

INSERT INTO emp VALUES (8039, 'Turu', 'Manager', 7839, '10-MAY-2020', 3000, 1500, 30);

SELECT emp.ename, dept.dname FROM emp, dept WHERE emp.ename like 'V%' 
    AND dept.deptno = emp.deptno;

SELECT emp.ename, emp.job, dept.deptno, dept.dname from emp, dept
    WHERE dept.loc = 'DALLAS' and dept.deptno = emp.deptno;

SELECT emp.ename, dept.dname, dept.loc FROM emp, dept WHERE emp.comm 
    IS NOT NULL AND dept.deptno = emp.deptno;

SELECT DISTINCT emp.job, dept.loc FROM emp, dept WHERE dept.deptno = 30 AND dept.deptno = emp.deptno;