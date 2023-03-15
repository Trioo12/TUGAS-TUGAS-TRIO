function tambah() {
    var angka1 = parseFloat(document.getElementById("kalkulator").angka.value);
    var angka2 = parseFloat(document.getElementById("kalkulator").angka2.value);
    var hasil = angka1 + angka2;
    if (isNaN(hasil)) {
      document.getElementById("kalkulator").hasil.value = "";
      alert("Maaf, angka belum terisi");
    } else {
      document.getElementById("kalkulator").hasil.value = hasil;
    }
  }
  
  function kurang() {
    var angka1 = parseFloat(document.getElementById("kalkulator").angka.value);
    var angka2 = parseFloat(document.getElementById("kalkulator").angka2.value);
    var hasil = angka1 - angka2;
    if (isNaN(hasil)) {
      document.getElementById("kalkulator").hasil.value = "";
      alert("Maaf, angka belum terisi");
    } else {
      document.getElementById("kalkulator").hasil.value = hasil;
    }
  }
  
  function kali() {
    var angka1 = parseFloat(document.getElementById("kalkulator").angka.value);
    var angka2 = parseFloat(document.getElementById("kalkulator").angka2.value);
    var hasil = angka1 * angka2;
    if (isNaN(hasil)) {
      document.getElementById("kalkulator").hasil.value = "";
      alert("Maaf, angka belum terisi");
    } else {
      document.getElementById("kalkulator").hasil.value = hasil;
    }
  }
  
  function bagi() {
    var angka1 = parseFloat(document.getElementById("kalkulator").angka.value);
    var angka2 = parseFloat(document.getElementById("kalkulator").angka2.value);
    var hasil = angka1 / angka2;
    if (isNaN(hasil)) {
      document.getElementById("kalkulator").hasil.value = "";
      alert("Maaf, angka belum terisi");
    } else {
      document.getElementById("kalkulator").hasil.value = hasil;
    }
  }
  
  function pangkat() {
    var angka1 = parseFloat(document.getElementById("kalkulator").angka.value);
    var angka2 = parseFloat(document.getElementById("kalkulator").angka2.value);
    var hasil = Math.pow(angka1, angka2);
    if (isNaN(hasil)) {
      document.getElementById("kalkulator").hasil.value = "";
      alert("Maaf, angka belum terisi");
    } else {
      document.getElementById("kalkulator").hasil.value = hasil;
    }
  }
  