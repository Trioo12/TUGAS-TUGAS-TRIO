-- SOAL 3.1
-- 1.	Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> SELECT * FROM produk WHERE (harga_beli * stok_produk) > 20000000;
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
1 row in set (0.004 sec)


-- 2.	Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko1]> select SUM(stok_produk - min_stock) as selisih from produk;
+---------+
| selisih |
+---------+
|      21 |
+---------+
1 row in set (0.001 sec)


-- 3.	Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko1]> SELECT SUM(stok_produk) as total_asset  from produk;
+-------------+
| total_asset |
+-------------+
|          57 |
+-------------+
1 row in set (0.001 sec)


-- 4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1990 AND 2004;
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | alamat     | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
|  1 | 011101 | Siti Fatimah   | Jakarta    | L    | JAKARTA    | 2002-08-02 | siti@gmail.com    |        1 |
|  2 | 011102 | ali            | SBY        | L    | SBY        | 2002-09-01 | ali@gmail.com     |        2 |
|  3 | 011104 | Aminah         | Sulawesi   | P    | Sulawesi   | 2001-04-04 | Aminah@gmail.com  |        3 |
|  5 | 011105 | Prayogo        | Yogyakarta | L    | Yogyakarta | 2003-01-09 | prayogo@gmail.com |        4 |
|  6 | 011106 | Kediri         | Kediri     | L    | Kediri     | 2004-04-04 | Brodi@gmail.com   |        5 |
|  8 | 011107 | Cana           | Bandung    | L    | Bandung    | 2003-08-06 | cana@gmail.com    |        6 |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
6 rows in set (0.004 sec)


-- 5.	Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) = 2002;
+----+--------+----------------+---------+------+-----------+------------+----------------+----------+
| id | kode   | nama_pelanggan | alamat  | jk   | tmp_lahir | tgl_lahir  | email          | kartu_id |
+----+--------+----------------+---------+------+-----------+------------+----------------+----------+
|  1 | 011101 | Siti Fatimah   | Jakarta | L    | JAKARTA   | 2002-08-02 | siti@gmail.com |        1 |
|  2 | 011102 | ali            | SBY     | L    | SBY       | 2002-09-01 | ali@gmail.com  |        2 |
+----+--------+----------------+---------+------+-----------+------------+----------------+----------+
2 rows in set (0.001 sec)



-- 6.	Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir) =04;
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
| id | kode   | nama_pelanggan | alamat   | jk   | tmp_lahir | tgl_lahir  | email            | kartu_id |
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
|  3 | 011104 | Aminah         | Sulawesi | P    | Sulawesi  | 2001-04-04 | Aminah@gmail.com |        3 |
|  6 | 011106 | Kediri         | Kediri   | L    | Kediri    | 2004-04-04 | Brodi@gmail.com  |        5 |
+----+--------+----------------+----------+------+-----------+------------+------------------+----------+
2 rows in set (0.004 sec)


-- 7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko1]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, YEAR(CURDATE()) - YEAR(tgl_lahir) AS umur FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1990 AND 2004;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Siti Fatimah   | JAKARTA    | 2002-08-02 |   21 |
| ali            | SBY        | 2002-09-01 |   21 |
| Aminah         | Sulawesi   | 2001-04-04 |   22 |
| Prayogo        | Yogyakarta | 2003-01-09 |   20 |
| Kediri         | Kediri     | 2004-04-04 |   19 |
| Cana           | Bandung    | 2003-08-06 |   20 |
+----------------+------------+------------+------+
6 rows in set (0.000 sec)







-- SOAL 3.2
-- 1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko1]> SELECT COUNT(*) FROM pelanggan WHERE YEAR(tgl_lahir) = 2002;
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.000 sec)



-- 2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko1]> SELECT COUNT(*) FROM pelanggan WHERE jk = 'P' AND tmp_lahir = 'Jakarta';
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
1 row in set (0.007 sec)




-- 3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko1]> SELECT SUM(stok_produk) FROM produk WHERE harga_produk < 10000;
+------------------+
| SUM(stok_produk) |
+------------------+
|                9 |
+------------------+
1 row in set (0.001 sec)

-- 4.	Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko1]> SELECT COUNT(*) FROM produk WHERE kode_produk LIKE 'K%';
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.006 sec)




-- 5.	Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko1]> SELECT AVG(harga_produk) AS rata_rata_harga_jual FROM produk WHERE harga_produk > 1000000;
+----------------------+
| rata_rata_harga_jual |
+----------------------+
|       3125000.000000 |
+----------------------+
1 row in set (0.000 sec)



-- 6.	Tampilkan jumlah stok yang paling besar

MariaDB [dbtoko1]> SELECT MAX(stok_produk) AS jumlah_stok_terbanyak FROM produk;
+-----------------------+
| jumlah_stok_terbanyak |
+-----------------------+
|                    31 |
+-----------------------+
1 row in set (0.001 sec)


-- 7.	Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_produk FROM produk WHERE stok_produk < min_stock;
+---------------+
| jumlah_produk |
+---------------+
|             5 |
+---------------+
1 row in set (0.000 sec)


-- 8.	Berapa total asset dari keseluruhan produk
MariaDB [dbtoko1]> SELECT SUM(harga_beli * stok_produk) AS total_asset FROM produk;
+--------------+
| total_asset  |
+--------------+
| 119007000.00 |
+--------------+
1 row in set (0.002 sec)




-- SOAL 3.3
-- 1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko1]> SELECT id_produk, nama_produk, stok_produk,
    -> CASE
    -> WHEN stok_produk <= min_stock THEN 'segera belanja'
    ->  ELSE 'stok aman'
    ->   END AS status_stok
    -> FROM produk;
+-----------+------------------+-------------+----------------+
| id_produk | nama_produk      | stok_produk | status_stok    |
+-----------+------------------+-------------+----------------+
|         1 | Sprite_Lemon     |           2 | stok aman      |
|         2 | Converse_vintage |           5 | stok aman      |
|         3 | Swallow x Bape   |           3 | stok aman      |
|         4 | Sprite           |           1 | segera belanja |
|         5 | TV               |          31 | stok aman      |
|         6 | TV 21 INCH       |           2 | segera belanja |
|         7 | Meja Makan       |           2 | segera belanja |
|         8 | Kulkas           |           5 | segera belanja |
|         9 | Tahu             |           4 | segera belanja |
|        10 | Manisan          |           2 | segera belanja |
+-----------+------------------+-------------+----------------+
10 rows in set (0.001 sec)



-- 2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko1]> SELECT id, nama_pelanggan,
    -> DATEDIFF(CURRENT_DATE, tgl_lahir)/365 AS umur,
    -> CASE
    -> WHEN DATEDIFF(CURRENT_DATE, tgl_lahir)/365 < 17 THEN 'muda'
    -> WHEN DATEDIFF(CURRENT_DATE, tgl_lahir)/365 BETWEEN 17 AND 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS kategori_umur
    -> FROM pelanggan;
+----+----------------+---------+---------------+
| id | nama_pelanggan | umur    | kategori_umur |
+----+----------------+---------+---------------+
|  1 | Siti Fatimah   | 20.7096 | Dewasa        |
|  2 | ali            | 20.6274 | Dewasa        |
|  3 | Aminah         | 22.0384 | Dewasa        |
|  5 | Prayogo        | 20.2712 | Dewasa        |
|  6 | Kediri         | 19.0356 | Dewasa        |
|  8 | Cana           | 19.6986 | Dewasa        |
+----+----------------+---------+---------------+
6 rows in set (0.006 sec)



-- 3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko1]> SELECT id_produk, kode_produk, nama_produk,
    -> CASE
    ->     WHEN kode_produk = 'TV01' THEN 'DVD Player'
    ->     WHEN kode_produk = 'K001' THEN 'Rice Cooker'
    ->     ELSE 'Tidak Ada'
    -> END AS bonus
    -> FROM produk;
+-----------+-------------+------------------+-------------+
| id_produk | kode_produk | nama_produk      | bonus       |
+-----------+-------------+------------------+-------------+
|         1 |             | Sprite_Lemon     | Tidak Ada   |
|         2 |             | Converse_vintage | Tidak Ada   |
|         3 |             | Swallow x Bape   | Tidak Ada   |
|         4 | SP1         | Sprite           | Tidak Ada   |
|         5 | TV01        | TV               | DVD Player  |
|         6 | TV02        | TV 21 INCH       | Tidak Ada   |
|         7 | K001        | Meja Makan       | Rice Cooker |
|         8 | K002        | Kulkas           | Tidak Ada   |
|         9 | T001        | Tahu             | Tidak Ada   |
|        10 | M001        | Manisan          | Tidak Ada   |
+-----------+-------------+------------------+-------------+
10 rows in set (0.000 sec)




-- SOAL 3.4
-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko1]> SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Bandung    |                1 |
| JAKARTA    |                1 |
| Kediri     |                1 |
| SBY        |                1 |
| Sulawesi   |                1 |
| Yogyakarta |                1 |
+------------+------------------+
6 rows in set (0.001 sec)


-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko1]> SELECT jenis_produk, COUNT(*) as jumlah_produk FROM produk GROUP BY jenis_produk;
+--------------+---------------+
| jenis_produk | jumlah_produk |
+--------------+---------------+
|              |             3 |
| 1            |             2 |
| 2            |             2 |
| 3            |             1 |
| 4            |             2 |
+--------------+---------------+
5 rows in set (0.001 sec)


-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tgl_lahir > DATE_SUB(CURDATE(), INTERVAL (SELECT AVG(YEAR(CURDATE())-YEAR(tgl_lahir)) FROM pelanggan) YEAR);
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | alamat     | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
|  1 | 011101 | Siti Fatimah   | Jakarta    | L    | JAKARTA    | 2002-08-02 | siti@gmail.com    |        1 |
|  2 | 011102 | ali            | SBY        | L    | SBY        | 2002-09-01 | ali@gmail.com     |        2 |
|  5 | 011105 | Prayogo        | Yogyakarta | L    | Yogyakarta | 2003-01-09 | prayogo@gmail.com |        4 |
|  6 | 011106 | Kediri         | Kediri     | L    | Kediri     | 2004-04-04 | Brodi@gmail.com   |        5 |
|  8 | 011107 | Cana           | Bandung    | L    | Bandung    | 2003-08-06 | cana@gmail.com    |        6 |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
5 rows in set (0.003 sec)


-- 4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_produk > (SELECT AVG(harga_produk) FROM produk);
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
| id_produk | kode_produk | nama_produk | harga_beli | harga_produk | stok_produk | min_stock | jenis_produk |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
|         5 | TV01        | TV          | 3000000.00 |   4000000.00 |          31 |         5 | 4            |
|         6 | TV02        | TV 21 INCH  | 2000000.00 |   1500000.00 |           2 |         7 | 2            |
|         7 | K001        | Meja Makan  | 1000000.00 |   2000000.00 |           2 |         4 | 4            |
|         8 | K002        | Kulkas      | 4000000.00 |   5000000.00 |           5 |        10 | 1            |
+-----------+-------------+-------------+------------+--------------+-------------+-----------+--------------+
4 rows in set (0.001 sec)


-- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko1]> SELECT p.*
    -> FROM pelanggan p
    -> JOIN kartu k ON p.kartu_id = k.id
    -> WHERE k.iuran > 90000;
Empty set (0.005 sec)


-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko1]> SELECT AVG(harga_produk) AS rata_rata_harga FROM produk WHERE harga_produk < (SELECT AVG(harga_produk) FROM produk);
+-----------------+
| rata_rata_harga |
+-----------------+
|    13666.666667 |
+-----------------+
1 row in set (0.001 sec)


-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko1]> SELECT p.*
    -> FROM pelanggan p
    -> JOIN kartu k ON p.kartu_id = k.id
    -> WHERE k.diskon > 3;
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | alamat     | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
|  1 | 011101 | Siti Fatimah   | Jakarta    | L    | JAKARTA    | 2002-08-02 | siti@gmail.com    |        1 |
|  2 | 011102 | ali            | SBY        | L    | SBY        | 2002-09-01 | ali@gmail.com     |        2 |
|  5 | 011105 | Prayogo        | Yogyakarta | L    | Yogyakarta | 2003-01-09 | prayogo@gmail.com |        4 |
+----+--------+----------------+------------+------+------------+------------+-------------------+----------+
3 rows in set (0.001 sec)