-- SOAL 2.1
-- 1.	Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_produk DESC;
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk      | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
|         8 | K002        | Kulkas           | 4000000.00 |   5000000.00 |           5 |        10 | 1            |
|         5 | TV01        | TV               | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         7 | K001        | Meja Makan       | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
|         6 | TV02        | TV 21 INCH       | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         2 |             | Converse_vintage |       0.00 |     50000.00 |           5 |         0 |              |
|         3 |             | Swallow x Bape   |       0.00 |     20000.00 |           3 |         0 |              |
|         4 | SP1         | Sprite           |    2000.00 |      5000.00 |           1 |         2 | 1            |
|        10 | M001        | Manisan          |     500.00 |      3000.00 |           2 |         2 | 2            |
|         9 | T001        | Tahu             |    1000.00 |      2000.00 |           4 |         6 | 3            |
|         1 |             | Sprite_Lemon     |       0.00 |      2000.00 |           2 |         0 |              |
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
10 rows in set (0.001 sec)

-- 2.	Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
MariaDB [dbtoko1]> Select kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Siti Fatimah   | JAKARTA    | 2002-08-02 |
| 011102 | ali            | SBY        | 2002-09-01 |
| 011104 | Aminah         | Sulawesi   | 2001-04-04 |
| 011105 | Prayogo        | Yogyakarta | 2003-01-09 |
| 011106 | Kediri         | Kediri     | 2004-04-04 |
| 011107 | Cana           | Bandung    | 2003-08-06 |
+--------+----------------+------------+------------+
6 rows in set (0.001 sec)

-- 3.	Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbtoko1]> SELECT kode_produk,nama_produk, stok_produk from produk WHERE stok_produk=4;
+-------------+-------------+-------------+
| kode_produk | nama_produk | stok_produk |
+-------------+-------------+-------------+
| T001        | Tahu        |           4 |
+-------------+-------------+-------------+
1 row in set (0.000 sec)

-- 4.	Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbtoko1]> SELECT * from pelanggan WHERE tmp_lahir='sulawesi';
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
| id | kode   | nama_pelanggan | alamat   | jk   | tmp_lahir | tgl_lahir  | email            | kartu_id |
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
|  3 | 011104 | Aminah         | Sulawesi | P    | Sulawesi  | 2001-04-04 | Aminah@gmail.com |        3 |
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
1 row in set (0.000 sec)

-- 5.	Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbtoko1]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Kediri         | Kediri     | 2004-04-04 |
| 011107 | Cana           | Bandung    | 2003-08-06 |
| 011105 | Prayogo        | Yogyakarta | 2003-01-09 |
| 011102 | ali            | SBY        | 2002-09-01 |
| 011101 | Siti Fatimah   | JAKARTA    | 2002-08-02 |
| 011104 | Aminah         | Sulawesi   | 2001-04-04 |
+--------+----------------+------------+------------+
6 rows in set (0.004 sec)



-- SOAL 2.2
-- 1.	Tampilkan data produk yang stoknya 3 dan 10
MariaDB [dbtoko1]> SELECT * from produk WHERE stok_produk=2 OR stok_produk=10;
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk  | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
|         1 |             | Sprite_Lemon |       0.00 |      2000.00 |           2 |         0 |              |
|         6 | TV02        | TV 21 INCH   | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan   | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
|        10 | M001        | Manisan      |     500.00 |      3000.00 |           2 |         2 | 2            |
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
4 rows in set (0.001 sec)

-- 2.	Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_produk < 5000000 AND harga_produk > 500000;
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         6 | TV02        | TV 21 INCH  | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan  | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
3 rows in set (0.001 sec)

-- 3.	Tampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbtoko1]> SELECT * FROM produk WHERE min_stock > stok_produk;
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         4 | SP1         | Sprite      |    2000.00 |      5000.00 |           1 |         2 | 1            |
|         6 | TV02        | TV 21 INCH  | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan  | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
|         8 | K002        | Kulkas      | 4000000.00 |   5000000.00 |           5 |        10 | 1            |
|         9 | T001        | Tahu        |    1000.00 |      2000.00 |           4 |         6 | 3            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
5 rows in set (0.001 sec)

-- 4.	Tampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | alamat     | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
|  6 | 011106 | Kediri         | Kediri     | L    | Kediri     | 2004-04-04 | Brodi@gmail.com   |        5 |
|  8 | 011107 | Cana           | Bandung    | L    | Bandung    | 2003-08-06 | cana@gmail.com    |        6 |
|  5 | 011105 | Prayogo        | Yogyakarta | L    | Yogyakarta | 2003-01-09 | prayogo@gmail.com |        4 |
|  2 | 011102 | ali            | SBY        | L    | SBY        | 2002-09-01 | ali@gmail.com     |        2 |
|  1 | 011101 | Siti Fatimah   | Jakarta    | L    | JAKARTA    | 2002-08-02 | siti@gmail.com    |        1 |
|  3 | 011104 | Aminah         | Sulawesi   | P    | Sulawesi   | 2001-04-04 | Aminah@gmail.com  |        3 |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
6 rows in set (0.001 sec)

-- 5.	Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir='yogyakarta' AND jk='L';
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | alamat     | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
|  5 | 011105 | Prayogo        | Yogyakarta | L    | Yogyakarta | 2003-01-09 | prayogo@gmail.com |        4 |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
1 row in set (0.001 sec)

-- 6.	Tampilkan data pelanggan yang ID nya 2,6 dan 8
MariaDB [dbtoko1]> SELECT * from pelanggan WHERE id IN (2,8,6);
+----+--------+----------------+---------+------+-----------+------------+-----------------+----------+
| id | kode   | nama_pelanggan | alamat  | jk   | tmp_lahir | tgl_lahir  | email           | kartu_id |
+----+--------+----------------+---------+------+-----------+------------+-----------------+----------+
|  2 | 011102 | ali            | SBY     | L    | SBY       | 2002-09-01 | ali@gmail.com   |        2 |
|  6 | 011106 | Kediri         | Kediri  | L    | Kediri    | 2004-04-04 | Brodi@gmail.com |        5 |
|  8 | 011107 | Cana           | Bandung | L    | Bandung   | 2003-08-06 | cana@gmail.com  |        6 |
+----+--------+----------------+---------+------+-----------+------------+-----------------+----------+
3 rows in set (0.000 sec)

-- 7.	Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_produk >= 300000 AND harga_produk<= 4000000;
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         6 | TV02        | TV 21 INCH  | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan  | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
3 rows in set (0.000 sec)




SOAL 2.3

-- 1.	Tampilkan produk yang kode awalnya huruf K dan huruf M
MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode_produk LIKE 'T%' OR kode_produk LIKE 'k%';
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         6 | TV02        | TV 21 INCH  | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan  | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
|         8 | K002        | Kulkas      | 4000000.00 |   5000000.00 |           5 |        10 | 1            |
|         9 | T001        | Tahu        |    1000.00 |      2000.00 |           4 |         6 | 3            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
5 rows in set (0.001 sec)

-- 2.	Tampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbtoko1]> SELECT * FROM produk WHERE LEFT(kode_produk, 1) != 'M';
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
+-----------+-------------+------------------+------------+--------------+-------------+-----------+--------------+
9 rows in set (0.005 sec)

-- 3.	Tampilkan produk-produk televisi
MariaDB [dbtoko1]> SELECT * FROM produk WHERE id_produk = '5' OR id_produk= '6';
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         6 | TV02        | TV 21 INCH  | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
2 rows in set (0.004 sec)

-- 4.	Tampilkan pelanggan mengandung huruf 'Ali'
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%Ali%';
+----+--------+----------------+--------+------+-----------+------------+---------------+----------+
| id | kode   | nama_pelanggan | alamat | jk   | tmp_lahir | tgl_lahir  | email         | kartu_id |
+----+--------+----------------+--------+------+-----------+------------+---------------+----------+
|  2 | 011102 | ali            | SBY    | L    | SBY       | 2002-09-01 | ali@gmail.com |        2 |
+----+--------+----------------+--------+------+-----------+------------+---------------+----------+
1 row in set (0.001 sec)


-- 5.	Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbtoko1]> SELECT * FROM pelanggan
    -> WHERE tmp_lahir NOT LIKE '%Jakarta%' AND nama_pelanggan LIKE '%yo%';
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | alamat     | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
|  5 | 011105 | Prayogo        | Yogyakarta | L    | Yogyakarta | 2003-01-09 | prayogo@gmail.com |        4 |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
1 row in set (0.001 sec)

-- 6.	Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE SUBSTRING(nama_pelanggan, 2, 1) = 'A';
+----+--------+----------------+---------+------+-----------+------------+----------------+----------+
| id | kode   | nama_pelanggan | alamat  | jk   | tmp_lahir | tgl_lahir  | email          | kartu_id |
+----+--------+----------------+---------+------+-----------+------------+----------------+----------+
|  8 | 011107 | Cana           | Bandung | L    | Bandung   | 2003-08-06 | cana@gmail.com |        6 |
+----+--------+----------------+---------+------+-----------+------------+----------------+----------+
1 row in set (0.004 sec)





-- SOAL 2.4
-- 1.	Tampilkan 2 data produk termahal
MariaDB [dbtoko1]> SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         8 | K002        | Kulkas      | 4000000.00 |   5000000.00 |           5 |        10 | 1            |
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
2 rows in set (0.001 sec)

-- 2.	Tampilkan produk yang paling murah
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_produk = (SELECT MIN(harga_produk) FROM produk);
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk  | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
|         1 |             | Sprite_Lemon |       0.00 |      2000.00 |           2 |         0 |              |
|         9 | T001        | Tahu         |    1000.00 |      2000.00 |           4 |         6 | 3            |
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
2 rows in set (0.008 sec)

-- 3.	Tampilkan produk yang stoknya paling banyak
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok_produk DESC LIMIT 1;
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
1 row in set (0.001 sec)

-- 4.	Tampilkan dua produk yang stoknya paling sedikit
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok_produk ASC LIMIT 2;
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk  | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
|         4 | SP1         | Sprite       |    2000.00 |      5000.00 |           1 |         2 | 1            |
|         1 |             | Sprite_Lemon |       0.00 |      2000.00 |           2 |         0 |              |
+-----------+-------------+--------------+------------+--------------+-------------+-----------+--------------+
2 rows in set (0.001 sec)

-- 5.	Tampilkan pelanggan yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tgl_lahir = (SELECT MAX(tgl_lahir) FROM pelanggan);
+----+--------+----------------+--------+------+-----------+------------+-----------------+----------+
| id | kode   | nama_pelanggan | alamat | jk   | tmp_lahir | tgl_lahir  | email           | kartu_id |
+----+--------+----------------+--------+------+-----------+------------+-----------------+----------+
|  6 | 011106 | Kediri         | Kediri | L    | Kediri    | 2004-04-04 | Brodi@gmail.com |        5 |
+----+--------+----------------+--------+------+-----------+------------+-----------------+----------+
1 row in set (0.000 sec)

-- 6.	Tampilkan pelanggan yang paling tua
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tgl_lahir = (SELECT MIN(tgl_lahir) FROM pelanggan);
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
| id | kode   | nama_pelanggan | alamat   | jk   | tmp_lahir | tgl_lahir  | email            | kartu_id |
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
|  3 | 011104 | Aminah         | Sulawesi | P    | Sulawesi  | 2001-04-04 | Aminah@gmail.com |        3 |
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
1 row in set (0.008 sec)
