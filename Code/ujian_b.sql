CREATE TABLE HARGATOKO2
(
    JBARANG VARCHAR2(100),
    HBARANG NUMBER
);

INSERT INTO HARGATOKO2 VALUES ('BUKU KOMIK', 20000);
INSERT INTO HARGATOKO2 VALUES ('BUKU NOVEL', 35000);
INSERT INTO HARGATOKO2 VALUES ('BUKU PROGRAM', 50000);

SET SERVEROUTPUT ON
    ACCEPT i_NAMA prompt 'Masukkan Nama Anda : ';
    'Vierza Vandifa'
    ACCEPT i_JENIS_BARANG prompt 'Masukkan Jenis Barang (BUKU KOMIK/BUKU NOVEL/BUKU PROGRAM) : ';
    'BUKU KOMIK'
    ACCEPT i_JUMLAH prompt 'Masukkan Jumlah Barang : ';
    100
DECLARE
    NAMA VARCHAR2(100) := &i_NAMA;
    JENIS_BARANG VARCHAR2(100) := &i_JENIS_BARANG;
    HARGA_BARANG NUMBER;
    JUMLAH NUMBER := &i_JUMLAH;
    DISKON VARCHAR2(100);
    TDISKON NUMBER;
    TOTAL NUMBER;
BEGIN
    SELECT HBARANG INTO HARGA_BARANG FROM HARGATOKO2 WHERE JBARANG = JENIS_BARANG;

    IF JUMLAH < 50 THEN
        DISKON := '0%';
        TDISKON := 0;
    ELSIF JUMLAH >= 50 AND JUMLAH <= 100 THEN
        DISKON := '10%';
        TDISKON := 0.1;
    ELSIF JUMLAH > 100 AND JUMLAH <= 250 THEN
        DISKON := '15%';
        TDISKON := 0.15;
    ELSIF JUMLAH > 250 THEN
        DISKON := '25%';
        TDISKON := 0.25;
    END IF;
    
    TOTAL := ((HARGA_BARANG * JUMLAH) - (HARGA_BARANG * JUMLAH * TDISKON));

    DBMS_OUTPUT.PUT_LINE('Masukkan Nama Anda                           : ' || NAMA);
    DBMS_OUTPUT.PUT_LINE('Masukkan Jenis Barang (BUKU/MAKANAN/MINUMAN) : ' || JENIS_BARANG);
    DBMS_OUTPUT.PUT_LINE('Masukkan Jumlah Barang                       : ' || JUMLAH);
    DBMS_OUTPUT.PUT_LINE('=============================================');
    DBMS_OUTPUT.PUT_LINE('Nama          : ' || NAMA);
    DBMS_OUTPUT.PUT_LINE('Jenis Barang  : ' || JENIS_BARANG);
    DBMS_OUTPUT.PUT_LINE('Jumlah        : ' || JUMLAH);
    DBMS_OUTPUT.PUT_LINE('Harga         : ' || HARGA_BARANG);
    DBMS_OUTPUT.PUT_LINE('Diskon        : ' || DISKON);
    DBMS_OUTPUT.PUT_LINE('Total         : ' || TOTAL);
    DBMS_OUTPUT.PUT_LINE('=============================================');
END;
/