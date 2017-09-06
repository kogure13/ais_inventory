<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$userClass = new User();

switch ($action) {
    case 'add' : $userClass->insertUser($params);
        break;
    case 'edit' : $userClass->updateUser($params);
        break;
    case 'delete' : $userClass->deleteUser($params);
        break;
    default :
        $userClass->getUser($params);
        return;
}

class User {
    
    protected $data = [];

    public function getUser($params) {
        $this->data = $this->getRecords($params);
        echo json_encode($this->data);
    }

    function getRecords() {
        $tname = "pengguna";
        $page = isset($_POST['page']) ? $_POST['page'] : 1;
        $rp = isset($_POST['rp']) ? $_POST['rp'] : 10;
        $sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'no_induk';
        $sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : 'desc';
        $query = isset($_POST['query']) ? $_POST['query'] : false;
        $qtype = isset($_POST['qtype']) ? $_POST['qtype'] : false;
        $qsearch = ($qtype != '' && $query != '') ? " WHERE $qtype LIKE '%{$query}%' " : '';

        $start = ($page - 1) * $rp;
        $sql = "SELECT * FROM " . $tname;
        $sql .= $qsearch;
        $sqlTot = $sql;
        
        $sql .= " ORDER BY " . $sortname . " " . $sortorder;
        $sql .= " LIMIT " . $start . " , " . $rp . " ";
        
        $qtot = mysql_query($sqlTot) or die("Error to fecth total data");
        $num_rows = mysql_num_rows($qtot);
        $queryRecords = mysql_query($sql) or die("Errot to fecth data");

        if ($num_rows > 0) {
            while ($row = mysql_fetch_assoc($queryRecords)) {
                $data[] = $row;
            }

            $json_data = [
                "page" => $page,
                "total" => $num_rows,
                "rows" => $data
            ];
            return $json_data;
        } else {
            $json_data = [
                "page" => 0,
                "total" => 0,
                "rows" => 0
            ];
            return $json_data;
        }
    }

    function insertUser($params) {
        $data = array();        
        $sql = "INSERT INTO pengguna";
        $sql .= " (nama_user, username, password, role, keterangan, status)";
        $sql .= " VALUES('".addslashes($params['nama_user'])."', "
                . "'".addslashes($params['username']). "', '" .addslashes($params['password']). "', "
                . "'".$params['role']."', '".$params['keterangan']."', '".$params['status']."')";

        echo $result = mysql_query($sql) or die("error to insert data");
    }

    function updateUser($params) {
        $data = array();
        $sql = "UPDATE pengguna";
        $sql .= " SET nama_user = '".addslashes($params['nama_user'])."', "
                . " username = '".addslashes($params['username'])."', "
                . " password = '".addslashes($params['password'])."', "
                . " role = '".$params['role']."', keterangan = '".$params['keterangan']."', "
                . " status = '".$params['status']."'";
        $sql .= " WHERE id = '".$_POST['edit_id']."'";

        echo $result = mysql_query($sql) or die("error to update data");
    }

    function deleteUser($params) {
        $data = array();
        $sql = "DELETE from pengguna";
        $sql .= " WHERE id = '".$params['id']."'";

        echo $result = mysql_query($sql) or die("error to delete data");
    }

}
