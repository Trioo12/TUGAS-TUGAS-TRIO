MariaDB [dbtoko1]> CREATE TABLE pembayaran (
    -> id INT NOT NULL AUTO_INCREMENT,
    -> pesanan_id INT NOT NULL,
    ->   jumlah_pembayaran DECIMAL(10,2) NOT NULL,
    -> status_pembayaran VARCHAR(10) NOT NULL,
    ->  PRIMARY KEY (id),
    -> FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
    -> );
Query OK, 0 rows affected (0.039 sec)
MariaDB [dbtoko2]> desc pembayaran;
+-------------------+---------------+------+-----+---------+----------------+
| Field             | Type          | Null | Key | Default | Extra          |
+-------------------+---------------+------+-----+---------+----------------+
| id                | int(11)       | NO   | PRI | NULL    | auto_increment |
| pesanan_id        | int(11)       | NO   | MUL | NULL    |                |
| jumlah_pembayaran | decimal(10,2) | NO   |     | NULL    |                |
| status_pembayaran | varchar(10)   | NO   |     | NULL    |                |
+-------------------+---------------+------+-----+---------+----------------+
4 rows in set (0.018 sec)


MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko2]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> UPDATE pembayaran p
    -> JOIN pesanan ps ON p.pesanan_id = ps.id
    -> SET p.status_pembayaran = 'Lunas'
    -> WHERE p.pesanan_id = NEW.pesanan_id AND ps.total <= (SELECT SUM(jumlah_pembayaran) FROM pembayaran WHERE pesanan_id = NEW.pesanan_id);
    -> END
    -> $$
Query OK, 0 rows affected (0.012 sec)
MariaDB [dbtoko1]> DELIMITER ;


MariaDB [dbtoko2]> INSERT INTO pesanan (id, tanggal, total, pelanggan_id) VALUES (3, '2002-02-06', 300000, 1);
Query OK, 1 row affected, 1 warning (0.005 sec)
MariaDB [dbtoko2]> select * from pesanan;
+----+------------+--------+--------------+--------------+
| id | tanggal    | total  | pelanggan_id | id_pelanggan |
+----+------------+--------+--------------+--------------+
|  1 | 2022-09-08 | 200000 |            1 |            0 |
|  2 | 2023-02-20 | 200000 |            1 |            0 |
|  1 | 2022-09-08 | 200000 |            1 |            0 |
|  2 | 2023-02-20 | 200000 |            1 |            0 |
|  0 | 2023-05-04 | 300000 |            0 |            1 |
|  0 | 2023-05-05 | 300000 |            1 |            0 |
|  3 | 2023-05-05 | 300000 |            1 |            0 |
|  3 | 2002-02-06 | 300000 |            1 |            0 |
+----+------------+--------+--------------+--------------+
MariaDB [dbtoko2]> SELECT * FROM pesanan WHERE id = 3;
+----+------------+--------+--------------+--------------+
| id | tanggal    | total  | pelanggan_id | id_pelanggan |
+----+------------+--------+--------------+--------------+
|  3 | 2023-05-05 | 300000 |            1 |            0 |
|  3 | 2002-02-06 | 300000 |            1 |            0 |
+----+------------+--------+--------------+--------------+
2 rows in set (0.001 sec)



MariaDB [dbtoko2]> INSERT INTO pembayaran (pesanan_id, jumlah_pembayaran, status_pembayaran)
    -> VALUES (1, 200000.00, 'Lunas');
Query OK, 1 rows affected (0.09 sec)