<?php
$id = $_REQUEST['id'];
$model = new Produk();
$data_produk = $model->getProduk($id);
?>
<br>
<div>
    <h5>
        <?= $data_produk['kode_produk'] ?>
    </h5>

</div>