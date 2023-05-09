<?php
include_once 'koneksi.php';
include_once 'models/Pesanan.php';

//step pertama yaitu menangkap request form
$tanggal = $_POST['tanggal'];
$total = $_POST['total'];
$pelanggan_id = $_POST['pelanggan_id'];
$id_pelanggan = $_POST['id_pelanggan'];


//menangkapan form diatas dijadikan array

$data = [
    $tanggal,
    $total,
    $pelanggan_id,
    $id_pelanggan

];
$model = new JenisPesanan();
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

        header('location:index.php?url=pesanan');
        break;
}
header('location:index.php?url=pesanan')

    ?>