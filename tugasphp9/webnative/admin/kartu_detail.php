<?php
$id = $_REQUEST['id'];
$model = new Kartu();
$data_kartu = $model->datakartu($id);
?>
<br>
<div>
    <h5>
        <?= $data_kartu['nama'] ?>
    </h5>

</div>