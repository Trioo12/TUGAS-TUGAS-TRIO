<?php
$id = $_REQUEST['id'];
$model = new JenisPesanan();
$pesanan = $model->getPesanan($id);
?>
<br>
<div>
    <h5>
        <?= $pesanan['total'] ?>
    </h5>

</div>