-- 1
SELECT ename, hiredate FROM emp
WHERE job IN(SELECT job FROM emp WHERE ename = 'BLAKE')
and ename <> 'BLAKE';

-- 2
SELECT ename, hiredate from emp
WHERE sal >(SELECT sal from emp where empno = 7698)
and empno <> 7698;

-- 3
SELECT empno, ename from emp
WHERE sal >(select avg (sal) from emp )
ORDER BY sal DESC;

-- 4
SELECT emp.ename, emp.deptno, emp.job
FROM emp, dept WHERE emp.deptno = dept.deptno and dept.loc = 'DALLAS';

-- 5
SELECT empno, ename FROM emp
WHERE deptno IN(SELECT deptno FROM emp WHERE ename LIKE '%T%')
AND sal >(SELECT avg (sal) from emp );

