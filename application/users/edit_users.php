<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();
$userClass = new User($connString);


if(!isset($_GET['id'])){
    exit();
}else{
    $params = $_GET['id'];
}
if ($params > 0) {
    $userClass->getUser($params);
} else {
    mysql_errno();
}

class User {

    protected $conn;    

    function __construct($connString) {
        $this->conn = $connString;
    }

    function getUser($params) {
        $json_data = [];
        $sql = "SELECT * FROM pengguna";
        $sql .= " WHERE id = $params";

        $result = mysqli_query($this->conn, $sql) or die();
                
        while ($row = mysqli_fetch_assoc($result)) {            
            $json_data = $row;
        }
        echo json_encode($json_data);
    }
}
