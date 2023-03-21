<!DOCTYPE html>
<html>
<head>
	<title>Bangun Datar - Jajar Genjang</title>
</head>
<body>

	<h2>Jajar Genjang</h2>
<form method="post" action="">
	<tr>
		<td>Alas:</td>
		<td>
		<input type="number" name="alas" required><br><br>
		</td>
	</tr>
	<tr>
		<td>Tinggi:</td>
		<td>
		<input type="number" name="tinggi" required><br><br>
		</td>
	</tr>
	<tr>
		<td>Tinggi Sisi Miring:</td>
		<td>
		<input type="number" name="tinggi_sisi_miring" required><br><br>
		</td>
	</tr>
	<tr>
		<td>
		<input type="submit" name="hitung" value="Hitung">
		</td>
	</tr>
	</form>

	<?php
	if(isset($_POST['hitung'])) {
		$alas = $_POST['alas'];
		$tinggi = $_POST['tinggi'];
		$tinggi_sisi_miring = $_POST['tinggi_sisi_miring'];

		$luas_permukaan = 2 * ($alas * $tinggi + $alas * $tinggi_sisi_miring + $tinggi * $tinggi_sisi_miring);
		$volume = $alas * $tinggi * $tinggi_sisi_miring;

		echo "<h3>Hasil Perhitungan:</h3>";
		echo "Luas Permukaan: " . $luas_permukaan . "<br>";
		echo "Volume: " . $volume . "<br>";
	}
	?>

</body>
</html>

