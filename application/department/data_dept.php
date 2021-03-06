<?php

include_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();

$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
$deptClass = new Dept($connString);

switch ($action) {
    case 'add' : $deptClass->insertDept($params);
        break;
    case 'edit' : $deptClass->updateDept($params);
        break;
    case 'delete' : $deptClass->deleteDept($params);
        break;
    default :
        $deptClass->getDept($params);
        return;
}

class Dept {
  

    function __construct($connString) {
        $this->conn = $connString;
    }

    public function getDept($params) {
        $this->data = $this->getRecords($params);
        echo json_encode($this->data);
    }

    function getRecords() {
        $tname = "master_department";
        $page = isset($_POST['page']) ? $_POST['page'] : 1;
        $rp = isset($_POST['rp']) ? $_POST['rp'] : 10;
        $sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'kode_department';
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
        
        $qtot = mysql_query($sqlTot) or die("Error to fecth total Data");
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

    function insertDept($params) {
        $data = array();        
        $sql = "INSERT INTO master_department";
        $sql .= " (kode_department, nama_department)";
        $sql .= " VALUES('".addslashes($params['kode_department'])."', "
                . "'".addslashes($params['nama_department']). "')";

        echo $result = mysql_query($sql) or die("error to insert data");
    }

    function updateDept($params) {
        $data = array();
        $sql = "UPDATE master_department";
        $sql .= " SET kode_department = '".addslashes($params['kode_department'])."', "
                . " nama_department ='".addslashes($params['nama_department'])."'";
        $sql .= " WHERE id = '".$_POST['edit_id']."'";

        echo $result = mysql_query($sql) or die("error to update data");
    }

    function deleteDept($params) {
        $data = array();
        $sql = "DELETE from master_department";
        $sql .= " WHERE id = '".$params['id']."'";

        echo $result = mysql_query($sql) or die("error to delete data");
    }

}
