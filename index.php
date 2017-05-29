<?php
session_start('inv_user');
include_once 'inc/class.php';
include_once 'inc/config.php';

$db = new dbObj();
$connString = $db->getConstring();

//if(!isset($_SESSION['user_login'])){
//    if(isset($_POST['inputUser'])){
//        $userUI = new User;
//        $username = $_POST['inputUser'];
//        $password = $userUI->hashPassword($_POST['password']);
//        
//        $validasi = $userUI->loginUser($username, $password);
//        if($validasi){
//            $userUI->login_success();
//        }else{
//            $userUI->login_failure();			
//        }
//    }
//    
//    include 'model/login.php';
// }else{
    $main = new Main;
    $userUI = new User;
    include 'model/main.php';
// }
?>