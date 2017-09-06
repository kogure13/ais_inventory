<?php 
session_start();
include_once 'inc/class.php';

$db = new dbObj();
$db->getConn();

if(!isset($_SESSION['user_login'])){
    
    include 'model/login.php';
 }else{
    $main = new Main;  
    include 'model/main.php';
 }
?>
