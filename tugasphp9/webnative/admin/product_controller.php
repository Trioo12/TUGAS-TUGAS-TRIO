<?php
include_once 'koneksi.php';
include_once 'models/Produk.php';

//step pertama yaitu menangkap request form
$kode_produk = $_POST['kode_produk'];
$nama_produk = $_POST['nama_produk'];
$harga_beli = $_POST['harga_beli'];
$harga_produk = $_POST['harga_produk'];
$stok_produk = $_POST['stok_produk'];
$min_stock = $_POST['min_stock'];
$jenis_produk = $_POST['jenis_produk'];

//menangkapan form diatas dijadikan array

$data = [
    $kode_produk,
    $nama_produk,
    $harga_beli,
    $harga_produk,
    $stok_produk,
    $min_stock,
    $jenis_produk
];
$model = new Produk();
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

        header('location:index.php?url=product');
        break;
}
header('location:index.php?url=product')

    ?>