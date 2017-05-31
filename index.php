<?php 
session_start();
include_once 'inc/class.php';
include_once 'inc/config.php';

$db = new dbObj();
$connString = $db->getConstring();

if(!isset($_SESSION['user_login'])){
    
    include 'model/login.php';
 }else{
    $main = new Main;  
    include 'model/main.php';
 }
?>