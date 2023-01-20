-- 1
SET SERVEROUTPUT ON

DECLARE
cursor cur_emp(sal_param NUMBER) IS
SELECT ename, sal FROM emp where sal > sal_param 
ORDER BY sal DESC;
nama emp.ename%TYPE;
gaji emp.sal%TYPE;
BEGIN
OPEN cur_emp(2000);
LOOP
FETCH cur_emp INTO nama, gaji;
EXIT WHEN cur_emp%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(nama || ' Mempunyai gaji : ' || gaji);
END LOOP;
CLOSE cur_emp;
END;
/

-- 2
DECLARE
cursor cur_emp_del(emp_id VARCHAR2) IS
SELECT empno FROM emp WHERE empno = emp_id for UPDATE;
id emp.empno%TYPE;
BEGIN
OPEN cur_emp_del('7839');
FETCH cur_emp_del INTO id;
IF cur_emp_del%FOUND THEN
DELETE FROM emp WHERE current of cur_emp_del;
DBMS_OUTPUT.PUT_LINE('EMP Turu');
DBMS_OUTPUT.PUT_LINE('Data Berhasil Dihapus');
COMMIT;
ELSE
DBMS_OUTPUT.PUT_LINE('Data Tidak Ditemukan');
END IF;
CLOSE cur_emp_del;
END;
/

-- 3
SET SERVEROUTPUT ON

DECLARE
CURSOR cur_emp_update(comp_emp_id NUMBER) IS
SELECT sal FROM emp WHERE empno = comp_emp_id for UPDATE of sal;
id emp.empno%TYPE;
BEGIN
OPEN cur_emp_update(7839);
FETCH cur_emp_update INTO id;
IF sql%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('Karyawan Tidak Ditemukan');
ELSE
UPDATE emp SET sal = sal * 2 WHERE current of cur_emp_update;
DBMS_OUTPUT.PUT_LINE('Karyawan Dengan ID : ' || id || ' Berhasil Diupdate');
END IF;
CLOSE cur_emp_update;
END;
/
