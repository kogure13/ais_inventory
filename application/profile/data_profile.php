<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();
$params = $_REQUEST;
$userClass = new User();

$userClass->updateUser($params);

class User {

    function updateUser($params) {
        $data = array();
        $sql = "UPDATE pengguna";
        $sql .= " SET username = '" . addslashes($params['username']) . "', "
                . " password = '" . addslashes($params['password']) . "'";
        $sql .= " WHERE id = '" . $_POST['edit_id'] . "'";

        echo $result = mysql_query($sql) or die("error to update data");
    }

}
