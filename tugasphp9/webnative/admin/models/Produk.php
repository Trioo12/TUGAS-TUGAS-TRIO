<?php
class Produk
{
    private $koneksi;
    public function __construct()
    {
        global $dbh; //instance object koneksi.php
        $this->koneksi = $dbh;
    }
    public function dataProduk()
    {
        $sql = "SELECT produk.*, jenis_produk.nama as kategori FROM produk INNER JOIN 
        jenis_produk ON jenis_produk = produk.jenis_produk";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;

    }
}


?>