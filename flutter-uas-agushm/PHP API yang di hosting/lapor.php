<?php

if ($_SERVER["REQUEST_METHOD"] === 'POST')
{
    require_once 'connect.php';
    $NIM= $_POST["NIM"];
    $nama = $_POST["nama"];
    $progdi= $_POST["progdi"];
    $kelas = $_POST["kelas"];
    $tgl= $_POST["tgl"];
    $jam = $_POST["jam"];
    $URL= $_POST["URL"];
    
    $query = "INSERT INTO lapor (`NIM`,`nama`,`progdi`,`kelas`,`tgl`,`jam`,`URL`)   VALUES('$NIM','$nama','$progdi','$kelas','$tgl','$jam','$URL')";

if(empty($NIM)){
	echo"NIM harus di isi";
}else if(empty($nama)){
	echo"nama harus di isi";

}else if(empty($progdi)){
	echo"progdi harus di isi";
}else if (empty($kelas)){
	echo"kelas harus di isi";

}else if (empty($tgl)){
	echo"tgl harus di isi";

}else if (empty($jam)){
	echo"jam harus di isi";

}else if (empty($URL)){
	echo"URL harus di isi";

}else{
    $result = $conn->query($query);
}
    if ($result == 1)
    {
        $data["message"] = "data saved successfully";
        $data["status"] = "Ok";
    }
    else
    {
        $data["message"] = "data not saved successfully";
        $data["status"] = "error";    
    }

}
else
{
    $data["message"] = "Format not supported";
    $data["status"] = "error";    
}
    echo json_encode($data);
?>