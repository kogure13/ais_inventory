<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();
$kategoriClass = new Kategori();

if(!isset($_GET['id'])){
    exit();
}else{
    $params = $_GET['id'];
}
if ($params > 0) {
    $kategoriClass->getKategori($params);
} else {
    mysql_errno();
}

class Kategori {

    function getKategori($params) {
        $json_data = array();
        $sql = "SELECT * FROM master_kategori";
        $sql .= " WHERE id = $params";

        $result = mysql_query($sql) or die();
                
        while ($row = mysql_fetch_assoc($result)) {            
            $json_data = $row;
        }
        echo json_encode($json_data);
    }
}
