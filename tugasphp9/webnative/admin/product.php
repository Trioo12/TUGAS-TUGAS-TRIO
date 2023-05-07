<?php
// include_once 'top.php';
// include_once 'menu.php';
$model = new Produk();
$data_produk = $model->dataProduk();

// foreach ($data_produk as $row) {
//     print $row['kode_produk'];
// }
?>

<h1 class="mt-4">Tables</h1>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
    <li class="breadcrumb-item active">Tables</li>
</ol>
<div class="card mb-4">
    <div class="card-body">
        DataTables is a third party plugin that is used to generate the demo table below. For more information about
        DataTables, please visit the
        <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
        .
    </div>
</div>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        DataTable Example
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
                <tr>
                    <th> No </th>
                    <th> Kode_Produk </th>
                    <th> Nama_produk </th>
                    <th> Harga_beli </th>
                    <th> Harga_produk </th>
                    <th> Stok_Produk </th>
                    <th> Min_stock </th>
                    <th> Jenis_Produk </th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th> No </th>
                    <th>Kode_Produk</th>
                    <th>Nama_produk</th>
                    <th>Harga_beli</th>
                    <th>Harga_produk</th>
                    <th>Stok_Produk</th>
                    <th>Min_stock</th>
                    <th>Jenis_Produk</th>
                </tr>
            </tfoot>
            <tbody>
                <?php
                $no = 1;
                foreach ($data_produk as $row) {

                    ?>



                    <tr>
                        <td>
                            <?= $no ?>
                        <td>
                        <td>
                            <?= $row['kode_produk'] ?>
                        </td>
                        <td>
                            <?= $row['nama_produk'] ?>
                        </td>
                        <td>
                            <?= $row['harga_beli'] ?>
                        </td>
                        <td>
                            <?= $row['harga_produk'] ?>
                        </td>
                        <td>
                            <?= $row['stok_produk'] ?>
                        </td>
                        <td>
                            <?= $row['min_stock'] ?>
                        </td>
                        <td>
                            <?= $row['jenis_produk'] ?>
                        </td>

                    </tr>
                    <?php
                    $no++;
                }
                ?>

            </tbody>
        </table>
    </div>
</div>
</div>
<?php
// include_once 'bottom.php';

?>