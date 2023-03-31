
<?php
require_once 'abstrak.php';
class Segitiga extends Bentuk2D {
    public $alas;
    public $tinggi;

    public function __construct($alas, $tinggi){
        $this->alas = $alas;
        $this->tinggi = $tinggi;
    }

    public function namaBidang(){
        return "<br>Segitiga";
    }

    public function luasBidang(){
        $luas = 0.5 * $this->alas * $this->tinggi;
        return $luas;
    }

    public function kelilingBidang(){
        // Anggaplah segitiga yang dimaksud adalah segitiga sama sisi
        $keliling = 3 * $this->alas;
        return $keliling;
    }
}
?>