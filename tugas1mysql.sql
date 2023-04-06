
-- Buat table produk pada database dbtoko1
MariaDB [dbtoko1]> create table produk(
    -> id_produk INT NOT NULL AUTO_INCREMENT,
    -> nama_produk VARCHAR(50) NOT NULL,
    -> harga_produk DECIMAL(10,2) NOT NULL,
    -> stok_produk INT NOT NULL,
    -> PRIMARY KEY (id_produk));
Query OK, 0 rows affected (0.035 sec)

-- Buat table vendor pada database dbtoko1
MariaDB [dbtoko1]> CREATE TABLE vendor (
    ->   id_vendor INT PRIMARY KEY AUTO_INCREMENT,
    ->   nama_vendor VARCHAR(255) NOT NULL,
    ->   alamat_vendor VARCHAR(255) NOT NULL,
    ->   telepon_vendor VARCHAR(20) NOT NULL
    -> );
Query OK, 0 rows affected (0.030 sec)

-- Buat table pembelian pada database dbtoko1
MariaDB [dbtoko1]> CREATE TABLE pembelian (
    ->   id_pembelian INT PRIMARY KEY AUTO_INCREMENT,
    ->   id_vendor INT NOT NULL,
    ->   tanggal_pembelian DATE NOT NULL,
    ->   total_pembelian DECIMAL(10,2) NOT NULL,
    ->   FOREIGN KEY (id_vendor) REFERENCES vendor(id_vendor)
    -> );
Query OK, 0 rows affected (0.027 sec)

-- Buat table pesananitems pada database dbtoko1
MariaDB [dbtoko1]> CREATE TABLE pesananitems (
    ->   id_pesanan INT NOT NULL,
    ->   id_produk INT NOT NULL,
    ->   jumlah_produk INT NOT NULL,
    ->   harga_produk DECIMAL(10,2) NOT NULL,
    ->   PRIMARY KEY (id_pesanan, id_produk));
Query OK, 0 rows affected (0.020 sec)

-- Menambahkan kolom alamat pada tables pelanggan dibawah query nama
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> ADD COLUMN alamat varchar(40) AFTER nama;
Query OK, 0 rows affected (0.012 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- Mengubah kolom nama pada tables pelanggan menjadi nama_pelanggan dan mengedit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(50);
Query OK, 0 rows affected (0.013 sec)
Records: 0  Duplicates: 0  Warnings: 0