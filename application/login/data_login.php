<?php

session_start();

include_once '../../inc/config.php';
$db = new dbObj();
$connString = $db->getConstring();
$userClass = new User($connString);

$uname = $_POST['uname'];
$passwd = $_POST['passwd'];

$userClass->getUser($uname, $passwd);

class User {

    protected $conn;

    function __construct($connString) {
        $this->conn = $connString;
    }

    function getUser($uname, $passwd) {
        $sql = "SELECT * FROM pengguna";
        $sql .= " WHERE username = '" . $uname . "' AND password = '" . $passwd . "'"
                . " AND status = 1";
        $qtot = mysqli_query($this->conn, $sql) or die("Error to fecth total");
        
        $data = mysqli_fetch_assoc($qtot);
        
        if (intval($qtot->num_rows) == 1) {
            echo 'true';
            $_SESSION['user_login'] = true;
            $_SESSION['id_user'] = $data['id'];
        } else {
            echo 'false';
            echo 'Incorrect Username/password';
        }
    }

}
