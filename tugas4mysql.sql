-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputPelanggan(kode varchar(20), nama varchar(50), alamat varchar(50), jk varchar(1), tmp_lahir varchar(50), tgl_lahir date, email varchar(50), kartu_id int)
    -> BEGIN
    -> INSERT INTO pelanggan (kode, nama_pelanggan, alamat, jk, tmp_lahir, tgl_lahir, email, kartu_id) VALUES (kode, nama, alamat, jk, tmp_lahir, tgl_lahir, email, kartu_id);
    -> END$$
Query OK, 0 rows affected (0.010 sec)
MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL inputPelanggan('011108', 'Budi', 'Semarang', 'L', 'Semarang', '2000-01-01', 'budi@gmail.com', 7);
Query OK, 1 row affected (0.007 sec)

MariaDB [dbtoko1]> select * from pelanggan;
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | alamat     | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
|  1 | 011101 | Siti Fatimah   | Jakarta    | L    | JAKARTA    | 2002-08-02 | siti@gmail.com    |        1 |
|  2 | 011102 | ali            | SBY        | L    | SBY        | 2002-09-01 | ali@gmail.com     |        2 |
|  3 | 011104 | Aminah         | Sulawesi   | P    | Sulawesi   | 2001-04-04 | Aminah@gmail.com  |        3 |
|  5 | 011105 | Prayogo        | Yogyakarta | L    | Yogyakarta | 2003-01-09 | prayogo@gmail.com |        4 |
|  6 | 011106 | Kediri         | Kediri     | L    | Kediri     | 2004-04-04 | Brodi@gmail.com   |        5 |
|  8 | 011107 | Cana           | Bandung    | L    | Bandung    | 2003-08-06 | cana@gmail.com    |        6 |
|  9 | 011108 | Budi           | Semarang   | L    | Semarang   | 2000-01-01 | budi@gmail.com    |        7 |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
7 rows in set (0.001 sec)


-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT * FROM pelanggan;
    -> END$$
Query OK, 0 rows affected (0.009 sec)
MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showPelanggan();




-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputProduk(kode_produk VARCHAR(10), nama_produk VARCHAR(50), harga_beli DECIMAL(18,2), harga_produk DECIMAL(18,2), stok_produk INT, min_stock INT, jenis_produk INT)
    -> BEGIN
    -> DECLARE msg VARCHAR(100);
    -> INSERT INTO produk(kode_produk, nama_produk, harga_beli, harga_produk, stok_produk, min_stock, jenis_produk)
    -> VALUES(kode_produk, nama_produk, harga_beli, harga_produk, stok_produk, min_stock, jenis_produk);
    -> SET msg = CONCAT('Produk dengan kode ', kode_produk, ' berhasil ditambahkan');
    -> END$$
Query OK, 0 rows affected (0.011 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL inputProduk('P01', 'Pisang Goreng', 5000.00, 10000.00, 10, 5, 2);
Query OK, 1 row affected (0.006 sec)
MariaDB [dbtoko1]> SELECT * FROM produk;
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk      | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
|         1 |             | Sprite_Lemon     |       0.00 |      2000.00 |           2 |         0 |              |
|         2 |             | Converse_vintage |       0.00 |     50000.00 |           5 |         0 |              |
|         3 |             | Swallow x Bape   |       0.00 |     20000.00 |           3 |         0 |              |
|         4 | SP1         | Sprite           |    2000.00 |      5000.00 |           1 |         2 | 1            |
|         5 | TV01        | TV               | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         6 | TV02        | TV 21 INCH       | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan       | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
|         8 | K002        | Kulkas           | 4000000.00 |   5000000.00 |           5 |        10 | 1            |
|         9 | T001        | Tahu             |    1000.00 |      2000.00 |           4 |         6 | 3            |
|        10 | M001        | Manisan          |     500.00 |      3000.00 |           2 |         2 | 2            |
|        11 | P01         | Pisang Goreng    |    5000.00 |     10000.00 |          10 |         5 | 2            |
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
11 rows in set (0.000 sec)



-- Buat fungsi showProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> DECLARE msg VARCHAR(500);
    -> SELECT * FROM produk;
    -> SET msg = CONCAT('Menampilkan semua produk');
    -> END$$
Query OK, 0 rows affected (0.014 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showProduk();
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk      | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
|         1 |             | Sprite_Lemon     |       0.00 |      2000.00 |           2 |         0 |              |
|         2 |             | Converse_vintage |       0.00 |     50000.00 |           5 |         0 |              |
|         3 |             | Swallow x Bape   |       0.00 |     20000.00 |           3 |         0 |              |
|         4 | SP1         | Sprite           |    2000.00 |      5000.00 |           1 |         2 | 1            |
|         5 | TV01        | TV               | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         6 | TV02        | TV 21 INCH       | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan       | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
|         8 | K002        | Kulkas           | 4000000.00 |   5000000.00 |           5 |        10 | 1            |
|         9 | T001        | Tahu             |    1000.00 |      2000.00 |           4 |         6 | 3            |
|        10 | M001        | Manisan          |     500.00 |      3000.00 |           2 |         2 | 2            |
|        11 | P01         | Pisang Goreng    |    5000.00 |     10000.00 |          10 |         5 | 2            |
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
11 rows in set (0.001 sec)

Query OK, 0 rows affected (0.037 sec)





-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE totalPesanan(pesanan_id INT, OUT total DECIMAL(18,2))
    -> BEGIN
    -> SELECT SUM(harga_produk * jumlah) INTO total FROM detail_pesanan
    -> INNER JOIN produk ON detail_pesanan.produk_id = produk.id_produk
    -> WHERE pesanan_id = pesanan_id;
    -> END$$
Query OK, 0 rows affected (0.010 sec)
MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL totalPesanan(1, @total);
Query OK, 0 rows affected (0.002 sec)

MariaDB [dbtoko1]> SELECT @total;
+--------+
| @total |
+--------+
| 200000 |
+--------+
1 row in set (0.000 sec)




-- tampilkan seluruh pesanan dari semua pelanggan
MariaDB [dbtoko1]> create procedure showPesanan()
    -> begin
    -> select pesanan.id, pesanan.tanggal, pelanggan.nama_pelanggan, pesanan.total from pesanan
    -> join pelangan on pesanan.pelanggan_id = pelanggan.id;
    -> end$$
Query OK, 0 rows affected (0.010 sec)

MariaDB [dbtoko1]> SELECT p.id, p.tanggal, p.total, pl.nama_pelanggan
    -> FROM pesanan p
    -> JOIN pelanggan pl ON p.pelanggan_id = pl.id;
+----+------------+--------+----------------+
| id | tanggal    | total  | nama_pelanggan |
+----+------------+--------+----------------+
|  1 | 2022-09-08 | 200000 | Siti Fatimah   |
|  2 | 2023-02-20 | 200000 | Siti Fatimah   |
+----+------------+--------+----------------+
2 rows in set (0.008 sec)




-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)

MariaDB [dbtoko1]> CREATE VIEW pesanan_produk_vw AS
    -> SELECT p.id AS id_pesanan, p.tanggal, p.total, pl.nama_pelanggan, pr.nama_produk
    -> FROM pesanan p
    -> JOIN pelanggan pl ON p.pelanggan_id = pl.id
    -> JOIN pesanan_produk pp ON p.id = pp.pesanan_id
    -> JOIN produk pr ON pp.produk_id = pr.id_produk;
Query OK, 0 rows affected (0.05 sec)
SELECT * FROM pesanan_produk_vw;
