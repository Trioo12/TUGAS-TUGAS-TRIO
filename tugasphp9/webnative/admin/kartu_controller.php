<?php
include_once 'koneksi.php';
include_once 'models/Kartu.php';

//step pertama yaitu menangkap request form
$kode = $_POST['kode'];
$nama = $_POST['nama'];
$diskon = $_POST['diskon'];
$iuran = $_POST['iuran'];
$ket = $_POST['ket'];



//menangkapan form diatas dijadikan array

$data = [
    $kode,
    $nama,
    $diskon,
    $iuran,
    $ket

];
$model = new Kartu();
$tombol = $_REQUEST['proses'];
switch ($tombol) {
    case 'simpan':
        $model->simpan($data);
        break;

    case 'ubah':
        $data[] = $_POST['idx'];
        $model->ubah($data);
        break;
    default;

        header('location:index.php?url=kartu');
        break;
}
header('location:index.php?url=kartu')

    ?>