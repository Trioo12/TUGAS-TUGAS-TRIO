<?php
require_once "Lingkaran.php";
require_once "persegiPanjang.php";
require_once "segitiga.php";

$lingkaran = new Lingkaran(7);
$persegiPanjang = new PersegiPanjang(3, 12);
$segitiga = new segitiga(5, 8);
$shapes = array($lingkaran, $persegiPanjang, $segitiga);

echo "<table border='1'>
    <tr>
        <th>Nama Bidang</th>
        <th>Luas Bidang</th>
        <th>Keliling Bidang</th>
    </tr>";

foreach ($shapes as $shape) {
    echo "<tr>";
    echo "<td>" . $shape->namaBidang() . "</td>";
    echo "<td>" . $shape->luasBidang() . "</td>";
    echo "<td>" . $shape->kelilingBidang() . "</td>";
    echo "</tr>";
}

echo "</table>";
?>
