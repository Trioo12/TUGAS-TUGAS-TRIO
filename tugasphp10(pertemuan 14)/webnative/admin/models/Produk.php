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
    public function getProduk($id)
    {
        $sql = "SELECT produk.*, jenis_produk.nama as kategori FROM produk INNER JOIN 
        jenis_produk ON jenis_produk = produk.jenis_produk WHERE produk.id = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
        $rs = $ps->fetch();
        return $rs;
    }

    public function simpan($data)
    {
        $sql = "INSERT INTO produk(kode_produk, nama_produk, harga_beli, harga_produk, stok_produk, min_stock, jenis_produk)
        values (?,?,?,?,?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }
    public function ubah($data)
    {
        $sql = "INSERT INTO produk(kode_produk=?, nama_produk=?, harga_beli=?, harga_produk=?, stok_produk=?, min_stock=?, jenis_produk=?)
        WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }
    public function hapus($id)
    {
        $sql = "DELETE FROM produk WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);

    }
}


?>