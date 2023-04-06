    MariaDB [dbtoko1]> CREATE TABLE kartu(
        ->     -> id int auto_increment primary key,
        -> kode varchar(6) unique,
        -> nama varchar(30) not null,
        -> diskon double,
        -> iuran double;)
    Query OK, 0 rows affected (0.017 sec)

    
        
    MariaDB [dbtoko1]> create table pelanggan(
        -> id int auto_increment primary key,
        -> kode varchar(10) unique,
        -> nama varchar(45),
        -> jk char(1),
        -> tmp_lahir varchar(30),
        -> tgl_lahir date,
        -> email varchar(45),
        -> kartu_id int not null references pelanggan(id));
    Query OK, 0 rows affected (0.023 sec)



    MariaDB [dbtoko1]> CREATE TABLE pesanan(
        -> id int NOT NULL auto_increment primary key,
        -> tanggal date,
        -> total double,
        -> pelanggan_id int NOT NULL REFERENCES pelanggang(id));
    Query OK, 0 rows affected (0.014 sec)
    


    MariaDB [dbtoko1]> create table pembayaran(
        -> id int not null auto_increment primary key,
        -> nokuitansi varchar(10) unique,
        -> tanggal date,
        -> jumlah double,
        -> ke int,
        -> pesanan_id int not null references pesanan(id));
    Query OK, 0 rows affected (0.018 sec)



    MariaDB [dbtoko1]> create table jenis_produk(
        -> id int not null auto_increment primary key,
        -> nama varchar(45));
    Query OK, 0 rows affected (0.022 sec)

