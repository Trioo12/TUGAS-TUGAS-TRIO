<?php
$id = $_REQUEST['id'];
$model = new JenisPelanggan();
$data_pelanggan = $model->getPelanggan($id);
?>
<br>
<div>
    <h5>
        <?= $data_pelanggan['nama_pelanggan'] ?>
    </h5>

</div>