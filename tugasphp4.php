<?php
$ar_prodi = ["SI"=>"Sistem Informasi", "TI"=>"Teknik Informatika","ILKOM"=>"Ilmu Komputer","TE"=>"Teknik Elektro"];

$ar_skill = ["HTML"=>10,"CSS"=>10, "Javascript"=>20, "RWD Bootstrap"=>20, "PHP"=>30, "MySQL"=>30,"Laravel"=>40];
$domisili = ["Jakarta","Bandung","Bekasi","Malang","Surabaya", "Sumenep"];

function hitung_skor($skills){
    $skor = 0;
    foreach($skills as $skill){
        if(isset($ar_skill[$skill])){
            $skor += [$skill];
        }
    }
    return $skor;
}
function kategori_skill($skor) {
    if($skor <= 0) {
        return "tidak memadai";
    } elseif($skor <= 40) {
        return "kurang";
    } elseif($skor <= 60) {
        return "cukup";
    } elseif($skor <= 100) {
        return "baik";
    } else {
        return "sangat baik";
    }
}

?>
<fieldset style="background-color:skyblue;" border="1px">
    <legend align="center">Form Registrasi Kelompok Belajar</legend>
<table align="center">
    <thead >
        <tr>
            <th align="center">Form Registrasi Politeknik Negeri Malang</th>
        </tr>
    </thead>
    <tbody>
        <form method="POST">
            <tr>
                <td>NIM : </td>
                <td> 
                    <input type="text" name="nim" >
                </td>
            </tr>
            <tr>
                <td>Nama : </td>
                <td> 
                    <input type="text" name="nama" >
                </td>
            </tr>
            <tr>
                <td>Jenis Kelamin : </td>
                <td> 
                    <input type="radio" name="jk" value="Laki-laki" >Laki-Laki &nbsp;
                    <input type="radio" name="jk" value="Laki-laki" >Perempuan 
                </td>
            </tr>
            <tr>
                <td>Program Studi: </td>
                <td> 
                    <select name="prodi">
                        <?php 

                        foreach($ar_prodi as $prodi => $v){
                            ?>
                            <option value="<?= $prodi ?>"><?= $v ?></option>
                       <?php } ?>
                        </select>
                </td>
            </tr>
            <tr>
                <td>Skill Programming : </td>
                <td> 
                    <?php 
                    foreach ($ar_skill as $skill => $s){
                        ?>
                    <input type="checkbox" name="skill[]" value="<?= $skill ?>" ><?= $skill ?>

                    <?php } ?>
                </td>
            </tr>
            <tr>
                <td>Domisili: </td>
                <td> 
                    <select name="domisili">
                        <?php 

                        foreach($domisili as $d){
                            ?>
                            <option value="<?= $d ?>"><?= $d ?></option>
                       <?php } ?>
                        </select>
                </td>
                <tr>
                <td>Email : </td>
                <td> 
                    <input type="text" name="email" >
                </td>
            </tr>

            </tr>
            <tfoot>
                <tr>
                    <th colspan="2">
                        <button name="proses">Submit</button>
                    </th>
                </tr>
            </tfoot>
    </table>
            

</fieldset>
<?php 
if(isset($_POST['proses'])){
    $nim = $_POST['nim'];
    $nama = $_POST['nama'];
    $jk = $_POST['jk'];
    $prodi = $_POST['prodi'];
    $skill = $_POST['skill'];
    $domisili = $_POST['domisili'];

    
    // Hitung skor skill
    $total_skill = 0;
    foreach($skill as $s) {
        $total_skill += $ar_skill[$s];
    }
    $skor_skill = $total_skill;
    $kategori_skill = kategori_skill($skor_skill);
    $email = $_POST['email'];

}

?>
NIM : <?= $nim ?><br>
Nama : <?= $nama ?><br>
Jenis Kelamin <?= $jk ?><br>
Program Studi : <?= $prodi ?><br>
Skill : 
<?php 
foreach($skill as $s){ ?>
<?= $s ?> ,
<?php } ?>
<br>Domisili : <?= $domisili ?><br>
Skor Skill : <?= $skor_skill ?><br>
Kategori Skill : <?= $kategori_skill ?><br>
Email : <?= $email ?>

