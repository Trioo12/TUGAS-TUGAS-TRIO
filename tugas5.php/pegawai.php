<?php
class Pegawai{
    protected $nip;
    public $nama;
    private $jabatan;
    private $agama;
    private $status;
    static $jml = 0;
    const PT = 'PT. HTP Indonesia';

    public function __construct($nip, $nama, $jabatan, $agama, $status){
        $this->nip = $nip;
        $this->nama = $nama;
        $this->jabatan = $jabatan;
        $this->agama = $agama;
        $this->status = $status;
        self::$jml++;
    }
    public function setGajiPokok($jabatan){
        $this->jabatan = $jabatan;
        switch($jabatan){
            case 'Manager': $gapok = 15000000; break;
            case 'Asisten Manager': $gapok = 10000000; break;
            case 'Kepala Bagian ': $gapok = 7000000; break;
            case 'Staff ': $gapok = 5000000; break;
            default: $gapok = 0;
        }
        return $gapok;
    }

    public function setTunjanganjabatan(){
        $tunjangan_jabatan = 0.2 * $this->setGajiPokok($this->jabatan);
        return $tunjangan_jabatan;
    }

    public function setTunjangankeluarga(){
        $tunjangan_keluarga = $this->status == "Sudah Menikah" ? (0.1 * $this->setGajiPokok($this->jabatan)) : 0;
        return $tunjangan_keluarga;
    }

    public function setZakatProfesi(){
        $gaji_kotor = $this->setGajiPokok($this->jabatan) + $this->setTunjanganjabatan() + $this->setTunjangankeluarga();
        $zakat = $this->agama == "Islam" && $gaji_kotor >= 6000000 ? (0.025 * $gaji_kotor) : 0;
        return $zakat;
    }

    public function getGajiBersih(){
        $gaji_bersih = $this->setGajiPokok($this->jabatan) + $this->setTunjanganjabatan() + $this->setTunjangankeluarga() - $this->setZakatProfesi();
        return $gaji_bersih;
    }

    public function cetak(){
        echo 'NIP Pegawai : '.$this->nip;
        echo '<br>Nama Pegawai : '.$this->nama;
        echo '<br>Jabatan : '. $this->jabatan;
        echo '<br>Agama : '.$this->agama;
        echo '<br>Status : '.$this->status;
        echo '<br>Gaji Pokok : Rp.'.number_format($this->setGajiPokok($this->jabatan),0,'.'.'.');
        echo '<br>Tunjangan Jabatan : Rp.'.number_format($this->setTunjanganjabatan(),0,'.'.'.');
        echo '<br>Tunjangan Keluarga : Rp.'.number_format($this->setTunjangankeluarga(),0,'.'.'.');
        echo '<br>Zakat Profesi : Rp.'.number_format($this->setZakatProfesi(),0,'.'.'.');
        echo '<br>Gaji Bersih : Rp. '.number_format($this->getGajiBersih(),0,'.'.'.');
        echo '<hr>';

    }

}
?>