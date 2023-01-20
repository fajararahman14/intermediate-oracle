SET SERVEROUTPUT ON
    ACCEPT i_empno prompt 'Masukkan Nomor Pegawai : ';
    7369
DECLARE
    v_empno NUMBER(4) := &i_empno;
    v_ename EMP.ename%TYPE;
    v_deptno EMP.deptno%TYPE;
    v_dname DEPT.dname%TYPE;
    v_job EMP.job%TYPE;
    v_sal EMP.sal%TYPE;
    v_loc DEPT.loc%TYPE;
    v_dept EMP.deptno%TYPE;
BEGIN
    SELECT ename, deptno, job, sal INTO v_ename, v_deptno, v_job, v_sal FROM emp WHERE empno = v_empno;
    SELECT dname, loc INTO v_dname, v_loc FROM dept WHERE deptno = v_deptno;
    DBMS_OUTPUT.PUT_LINE('NO_PEG | NAMA_PEG | NO_DEPT | DEPARTEMENT | PEKERJAAN | GAJI | LOKASI');
    DBMS_OUTPUT.PUT_LINE('' || v_empno || '   | ' || v_ename || '    | ' || v_deptno || '      | ' || v_dname || '    | ' || v_job || '     | ' || v_sal || '  | ' || v_loc);
    DBMS_OUTPUT.PUT_LINE('================ DATA PEGAWAI RINCIAN ================');
    DBMS_OUTPUT.PUT_LINE('Nomor Pegawai         : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('Nama Pegawai          : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('Nomor Departemen      : ' || v_deptno);
    DBMS_OUTPUT.PUT_LINE('Anda Berkerja Sebagai : ' || v_job);
    DBMS_OUTPUT.PUT_LINE('Gaji Anda             : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Lokasi Bekerja Anda   : ' || v_loc);
END;
/