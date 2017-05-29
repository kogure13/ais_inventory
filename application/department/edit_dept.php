<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();
$deptClass = new Dept($connString);


if(!isset($_GET['id'])){
    exit();
}else{
    $params = $_GET['id'];
}
if ($params > 0) {
    $deptClass->getDept($params);
} else {
    mysql_errno();
}

class Dept {

    protected $conn;    

    function __construct($connString) {
        $this->conn = $connString;
    }

    function getDept($params) {
        $json_data = array();
        $sql = "SELECT * FROM master_department";
        $sql .= " WHERE id = $params";

        $result = mysqli_query($this->conn, $sql) or die();
                
        while ($row = mysqli_fetch_assoc($result)) {            
            $json_data = $row;
        }
        echo json_encode($json_data);
    }
}
