<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Gaji Pegawai</title>
    <link rel="stylesheet" type="text/css" href="css/tugas.css">

</head>
<body>
    <form method="POST">
        
        <p>Rincian Gaji Pegawai</p>

        <label>Nama Pegawai</label>
        <input type="text" name="nama" placeholder="Masukkan Nama"><br>
        <label>Jabatan</label>
        <select name="jabatan">
            <option value="">-- Pilih Jabatan Anda --</option>
            <option value="manager">Manager</option>
            <option value="asisten">Asisten</option>
            <option value="kabag">Kabag</option>
            <option value="staff">Staff</option>
        </select><br>
        <label>Status Pernikahan Anda</label>
        <input type="radio" name="status" value="belum_nikah" checked> Belum Menikah
        <input type="radio" name="status" value="nikah"> Menikah<br>
        <label>Jumlah Anak</label>
        <input type="number" name="jumlah_anak" placeholder="Masukkan Jumlah Anak"><br>
        <button name="proses" type="submit">Proses</button>
    </form>
    <?php
error_reporting(0);

$nama = $_POST['nama'];
$jabatan = $_POST['jabatan'];
$status = $_POST['status'];
$jumlah_anak = $_POST['jumlah_anak'];
$tombol = $_POST['proses'];

$gaji_pokok = 0;
$tunjangan_jabatan = 0;
$tunjangan_keluarga = 0;
$gaji_kotor = 0;
$zakat_profesi = 0;
$take_home_pay = 0;

switch ($jabatan) {
    case "manager":
        $gaji_pokok = 20000000;
        break;
    case "asisten":
        $gaji_pokok = 15000000;
        break;
    case "kabag":
        $gaji_pokok = 10000000;
        break;
    case "staff":
        $gaji_pokok = 4000000;
        break;
}

$tunjangan_jabatan = 0.2 * $gaji_pokok;

if ($status == "nikah") {
    if ($jumlah_anak >= 3 && $jumlah_anak <= 5) {
        $tunjangan_keluarga = 0.1 * $gaji_pokok;
    } else if ($jumlah_anak >= 1 && $jumlah_anak <= 2) {
        $tunjangan_keluarga = 0.05 * $gaji_pokok;
    }
}

$gaji_kotor = $gaji_pokok + $tunjangan_jabatan + $tunjangan_keluarga;

$zakat_profesi = (isset($tombol) && $gaji_kotor >= 6000000) ? 0.025 * $gaji_kotor : 0;

$take_home_pay = $gaji_kotor - $zakat_profesi;

if (isset($tombol)) {
    ?>
    <div class="result">
      <p>Rincian Gaji Pegawai</p>
      <table>
        <tr>
          <th >Nama Pegawai</th>
          <td><?= $nama ?></td>
        </tr>
        <tr>
          <th>Jabatan</th>
          <td><?= ucfirst($jabatan) ?></td>
        </tr>
        <tr>
          <th>Status Pernikahan</th>
          <td><?= ucfirst(str_replace('_', ' ', $status)) ?></td>
        </tr>
        <tr>
          <th>Jumlah Anak</th>
          <td><?= $jumlah_anak ?></td>
        </tr>
        <tr>
          <th>Gaji Pokok</th>
          <td><?= number_format($gaji_pokok, 0, ',', '.') ?></td>
        </tr>
        <tr>
          <th>Tunjangan Jabatan</th>
          <td><?= number_format($tunjangan_jabatan, 0, ',', '.') ?></td>
        </tr>
        <tr>
          <th>Tunjangan Keluarga</th>
          <td><?= number_format($tunjangan_keluarga, 0, ',', '.') ?></td>
        </tr>
        <tr>
          <th>Gaji Kotor</th>
          <td><?= number_format($gaji_kotor, 0, ',', '.') ?></td>
        </tr>
        <tr>
          <th>Zakat Profesi</th>
          <td><?= number_format($zakat_profesi, 0, ',', '.') ?></td>
        </tr>
        <tr>
          <th>Take Home Pay</th>
          <td><?= number_format($take_home_pay, 0, ',', '.') ?></td>
        </tr>


<?php } ?>
</body>
</html>