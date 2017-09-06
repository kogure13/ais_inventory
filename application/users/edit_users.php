<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();
$userClass = new User();

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

    function getUser($params) {
        $json_data = [];
        $sql = "SELECT * FROM pengguna";
        $sql .= " WHERE id = $params";

        $result = mysql_query($sql) or die();
                
        while ($row = mysql_fetch_assoc($result)) {            
            $json_data = $row;
        }
        echo json_encode($json_data);
    }
}
