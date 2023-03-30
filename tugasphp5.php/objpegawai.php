<?php
require('pegawai.php');

// Membuat objek pegawai dengan data yang diberikan
$objPegawai1 = new Pegawai('1523840982409223', 'Trio', 'Manager', 'Islam', 'Sudah Menikah');
$objPegawai2 = new Pegawai('4585329004568546', 'Joko', 'Asisten Manager', 'Islam', 'Belum Menikah');
$objPegawai3 = new Pegawai('6369206473573489', 'Agos', 'Asisten Manager', 'Kristen', 'Belum Menikah');
$objPegawai4 = new Pegawai('5733192835549396', 'Ais', 'Asisten Manager', 'Islam', 'Sudah Menikah');
$objPegawai5 = new Pegawai('3997215600862345', 'Sari', 'Asisten Manager', 'Buddha', 'Sudah Menikah');

// Menampilkan struktur gaji pegawai
$objPegawai1->cetak();
$objPegawai2->cetak();
$objPegawai3->cetak();
$objPegawai4->cetak();
$objPegawai5->cetak();

// Menampilkan jumlah pegawai
echo "Jumlah Pegawai: " . Pegawai::$jml . "<br>";

// Menampilkan konstanta PT
echo "Nama Perusahaan: " . Pegawai::PT;
?>