<?php
require_once 'abstrak.php';

class Lingkaran extends Bentuk2D {
    public $jari2;

    public function __construct($jari2){
        $this->jari2 = $jari2;
    }

    public function namaBidang(){
        return "<br>Lingkaran";
    }

    public function luasBidang(){
        $luas = 3.14*$this->jari2 * $this->jari2;
        return $luas;
    }

    public function kelilingBidang(){
        $keliling = 3.14 * $this->jari2 * $this->jari2;
        return $keliling;
    }
}
?>