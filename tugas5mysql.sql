-- Buat Table pesanan dan table pembayaran
MariaDB [bisnis]> CREATE TABLE pesanan (
    ->   id_pesanan INT PRIMARY KEY,
    ->   nama_pelanggan VARCHAR(50),
    ->   total_harga DECIMAL(10,2),
    ->   status_pembayaran VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.026 sec)

MariaDB [bisnis]> CREATE TABLE pembayaran (
    ->   id_pembayaran INT PRIMARY KEY,
    ->   id_pesanan INT,
    ->   tanggal_pembayaran DATE,
    ->   jumlah_pembayaran DECIMAL(10,2),
    ->   status_pembayaran VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.023 sec)




-- buat trigger untuk mengubah status pembayaran menjadi 'Lunas' ketika pembayaran sudah dilakukan
MariaDB [bisnis]> delimiter $$
MariaDB [bisnis]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    ->   UPDATE pesanan
    ->   SET status_pembayaran = 'lunas'
    ->   WHERE id_pesanan = NEW.id_pesanan;
    -> END
    -> $$
Query OK, 0 rows affected (0.014 sec)

MariaDB [bisnis]> DELIMITER ;




-- gunakan query INSERT INTO untuk melakukan pesanan dan pembayaran
MariaDB [bisnis]> INSERT INTO pesanan (id_pesanan, nama_pelanggan, total_harga, status_pembayaran)
    -> VALUES
    ->   (1, 'John Doe', 50000, 'belum lunas'),
    ->   (2, 'Jane Smith', 75000, 'belum lunas'),
    ->   (3, 'Bob Johnson', 100000, 'belum lunas'),
    ->   (4, 'Alice Lee', 125000, 'belum lunas');
Query OK, 4 rows affected (0.007 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [bisnis]> select * from pesanan;
+------------+----------------+-------------+-------------------+
| id_pesanan | nama_pelanggan | total_harga | status_pembayaran |
+------------+----------------+-------------+-------------------+
|          1 | John Doe       |    50000.00 | belum lunas       |
|          2 | Jane Smith     |    75000.00 | belum lunas       |
|          3 | Bob Johnson    |   100000.00 | belum lunas       |
|          4 | Alice Lee      |   125000.00 | belum lunas       |
+------------+----------------+-------------+-------------------+
4 rows in set (0.000 sec)


MariaDB [bisnis]> INSERT INTO pembayaran (id_pembayaran, id_pesanan, jumlah_pembayaran)
    -> VALUES (2, 2, 75000);
Query OK, 1 row affected (0.005 sec)\






-- tampilkan hasil pesanan LUNAS
MariaDB [bisnis]> SELECT * FROM pesanan WHERE id_pesanan = 2;
+------------+----------------+-------------+-------------------+
| id_pesanan | nama_pelanggan | total_harga | status_pembayaran |
+------------+----------------+-------------+-------------------+
|          2 | Jane Smith     |    75000.00 | lunas             |
+------------+----------------+-------------+-------------------+
1 row in set (0.000 sec)

