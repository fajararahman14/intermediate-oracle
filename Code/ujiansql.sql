SELECT * FROM emp, dept, salgrade;

-- 1
SELECT ename AS NAMA, dname AS DEPARTEMENT, sal AS GAJI, grade AS GOLONGAN 
FROM emp, dept, salgrade 
WHERE emp.deptno = dept.deptno AND dname = 'RESEARCH'
AND sal >= losal AND sal <= hisal;

--2 
SELECT empno AS NOMOR_PEGAWAI, ename AS NAMA, deptno AS NOMOR_DEPARTEMENT FROM emp WHERE
ename LIKE '%O%' AND ename <> 'FORD' ORDER BY ename;

--3
SELECT ename AS NAMA, job AS PEKERJAAN, hiredate AS TGL_MASUK, sal AS GAJI FROM emp WHERE
SAL > 2500 ORDER BY ename;