<?php

session_start();

include_once '../../inc/class.php';
$db = new dbObj();
$userClass = new User();

$uname = $_POST['uname'];
$passwd = $_POST['passwd'];
$db->getConn();
$userClass->getUser($uname, $passwd);

class User {

    function getUser($uname, $passwd) {
        $sql = "SELECT * FROM pengguna";
        $sql .= " WHERE username = '" . $uname . "' AND password = '" . $passwd . "'"
                . " AND status = 1";
        $qtot = mysql_query($sql) or die("Error to fecth total");
        $num_rows = mysql_num_rows($qtot);
        $data = mysql_fetch_assoc($qtot);

        if ($data['login_status'] == 0) {
            if ($num_rows == 1) {
                echo 'true';
                $_SESSION['user_login'] = true;
                $_SESSION['id_user'] = $data['id'];
                $id = $_SESSION['id_user'];
                $_SESSION['nama_user'] = $data['nama_user'];
                $_SESSION['foto'] = $data['foto_profile'];

                $uLogin = "UPDATE pengguna set login_status = 1 WHERE id = '$id'";
                $result = mysql_query($uLogin);
            } else {
                echo 'false';
                echo 'Incorrect Username/password';
            }
        } else {
            echo 'denied';            
        }
    }

}
