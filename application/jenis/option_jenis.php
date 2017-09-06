<?php
require_once '../../inc/class.php';
$db = new dbObj();
$connString = $db->getConn();

$params = $_REQUEST;

$optionClass = new Option();
$optionClass->getOption($params);

class Option {    
    
    function getOption($params) {
        $json_data = array();
        $sql = "SELECT * FROM master_kategori";
        $result = mysql_query($sql);
        
        while ($row = mysql_fetch_assoc($result)){
            $json_data[] = $row;
        }                
        
        echo json_encode($json_data);
    }
}