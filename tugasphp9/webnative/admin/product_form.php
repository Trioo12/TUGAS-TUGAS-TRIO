<br>
<?php
$obj_produk = new Produk();
$data_produk = $obj_produk->dataProduk();
?>
<form action="produk_controller.php" method="POST">
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Kode Produk</label>
        <div class="col-8">
            <input id="kode_produk" name="kode_produk" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text2" class="col-4 col-form-label">Nama Produk</label>
        <div class="col-8">
            <input id="nama_produk" name="nama_produk" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text3" class="col-4 col-form-label">Harga Beli</label>
        <div class="col-8">
            <input id="harga_beli" name="harga_beli" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text" class="col-4 col-form-label">Harga Produk</label>
        <div class="col-8">
            <input id="harga_produk" name="harga_produk" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text4" class="col-4 col-form-label">Stok Produk</label>
        <div class="col-8">
            <input id="stok_produk" name="stok_produk" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text5" class="col-4 col-form-label">Min Stok</label>
        <div class="col-8">
            <input id="min_stock" name="min_stock" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text6" class="col-4 col-form-label">Jenis Produk</label>
        <div class="col-8">
            <input id="jenis_produk" name="jenis_produk" type="text" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <div class="offset-4 col-8">
            <button name="proses" type="submit" value="simpan" class="btn btn-primary">Submit</button>
        </div>
    </div>
</form>