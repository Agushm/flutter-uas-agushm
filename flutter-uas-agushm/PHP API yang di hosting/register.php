<?php

if ($_SERVER["REQUEST_METHOD"] === 'POST')
{
    require_once 'connect.php';
    $NIM= $_POST["NIM"];
    $nama = $_POST["nama"];
    $mata_kuliah= $_POST["mata_kuliah"];
    $email = $_POST["email"];
    $query = "INSERT INTO register (`NIM`,`nama`,`mata_kuliah`,`email`)   VALUES('$NIM','$nama','$mata_kuliah','$email')";

if(empty($NIM)){
	echo"NIM harus di isi";
}else if(empty($nama)){
	echo"nama harus di isi";

}else if(empty($mata_kuliah)){
	echo"mata_kuliah harus di isi";
}else if (empty($email)){
	echo"email harus di isi";
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