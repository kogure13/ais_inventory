<?php

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();
$userClass = new User($connString);

$params = $_REQUEST;
$action = isset($params['action']) != '' ? $params['action'] : '';

switch ($action){
    case 'login': $userClass->getUser($params);
        break;
}


class User {
    protected $conn;    

    function __construct($connString) {
        $this->conn = $connString;
    }
    
    function getUser($params){
        $sql = "SELECT * FROM pengguna";
        $sql .= " WHERE username = '".$params['uname']."' and password = '".$params['passwd']."'";
        $qtot = mysqli_query($this->conn, $sql) or die("Error to fecth total");
        
        if(intval($qtot->num_rows) == 1){
            $_SESSION['user_login'] = true;
            $_SESSION['id_user'] = $data['id'];
            
        }else{
            echo 'Incorrect Username/password';
        }
    }
}