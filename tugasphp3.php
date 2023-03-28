<?php
$m1 = ["NIM" => "2041160024", "nama"=> "Trio", "nilai"=> 100];
$m2 = ["NIM" => "2041160034", "nama"=> "Suto", "nilai"=> 65];
$m3 = ["NIM" => "2041160044", "nama"=> "Andi", "nilai"=> 55];
$m4 = ["NIM" => "2041160054", "nama"=> "Dina", "nilai"=> 83];
$m5 = ["NIM" => "2041160064", "nama"=> "Mario", "nilai"=> 96];
$m6 = ["NIM" => "2041160074", "nama"=> "Angel", "nilai"=> 13];
$m7 = ["NIM" => "2041160084", "nama"=> "Toni", "nilai"=> 70];
$mahasiswa = [$m1,$m2,$m3,$m4,$m5,$m6,$m7];
$ar_judul = ["no", "NIM", "Nama", "Nilai", "Keterangan", "Grade", "Pendidikan"];

?>

<table border="10px" width="100%" bgcolor="bluesky">
<thead>
    <tr>
    <?php 
    foreach($ar_judul as $judul){
        ?>
        <th><?= $judul ?></th>
        <?php }?>
    </tr>
</thead>
<tbody>
<?php
$no = 1;
$total_nilai = 0;
$nilai_tertinggi = $mahasiswa[0]["nilai"];
$nilai_terendah = $mahasiswa[0]["nilai"];
foreach($mahasiswa as $mhs){
  $ket = ($mhs["nilai"]>=60) ? "lulus" : "tidak lulus";
  //grade
  if ($mhs['nilai'] >= 85 && $mhs['nilai'] <= 100) $grade = 'A';
else if ($mhs['nilai']>= 75 && $mhs['nilai'] < 84) $grade = 'B';
else if ($mhs['nilai']>= 60 && $mhs['nilai'] < 74) $grade = 'C';
else if ($mhs['nilai']>= 30 && $mhs['nilai'] < 59) $grade = 'D';
else if ($mhs['nilai']>= 0 && $mhs['nilai'] < 29) $grade = 'E';
else $grade = '';

    //predikat
    switch ($grade) {
      case "A":
          $predikat = "Sangat Memuaskan";
          break;
      case "B":
          $predikat = "Memuaskan";
          break;
      case "C":
          $predikat = "Cukup";
          break;
      case "D":
          $predikat = "Kurang";
          break;
      case "E":
          $predikat = "Sangat Kurang";
          break;
      default:
          $predikat = "";
          break;
  }
?>
<tr>
  <td><?= $no ?> </td>
  <td><?= $mhs['NIM']?></td>
  <td><?= $mhs['nama']?></td>
  <td><?= $mhs['nilai']?></td>
  <td><?= $ket ?></td>
  <td><?= $grade ?></td>
  <td><?= $predikat ?></td>
</tr>
<?php $no++; } ?>
</tbody>
<tfoot>
    <tr>
        <td colspan="3">Jumlah mahasiswa:</td>
        <td><?= count($mahasiswa) ?></td>
        <td colspan="3"></td>
    </tr>
    <tr>
        <td colspan="3">Nilai tertinggi:</td>
        <td><?= max(array_column($mahasiswa, 'nilai')) ?></td>
        <td colspan="3"></td>
    </tr>
    <tr>
        <td colspan="3">Nilai terendah:</td>
        <td><?= min(array_column($mahasiswa, 'nilai')) ?></td>
        <td colspan="3"></td>
    </tr>
    <tr>
        <td colspan="3">Rata-rata:</td>
        <td><?= array_sum(array_column($mahasiswa, 'nilai'))/count($mahasiswa) ?></td>
        <td colspan="3"></td>
   </tr>
</tfoot>