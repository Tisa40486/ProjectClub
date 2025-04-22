<?php

require_once(__DIR__ . "/../Code/Html/login.html");
require_once(__DIR__ . "/databaseconnect.php");

$postData = $_POST;  // $_POST c'est toujours un tableau

if(empty($postData["user_name"])){
    echo "Veuillez saisir un nom.";
    return;
}

if(empty($postData["user_password"])){
    echo "Veuillez saisir un mot de passe.";
    return;
}

if(strlen($postData["user_name"]) > 15){
    echo "Votre nom est trop long.";
    return;
}

if(strlen($postData["user_password"]) > 20){
    echo "Votre mot de passe est trop long.";
    return;
}



$query = $mysqlClient->prepare('SELECT user_name,user_password,idUser FROM Utilisateurs WHERE user_name = :name');
$query->execute([
    'name' => $postData["user_name"]]);
$queryResult = $query->fetch();

if($queryResult == false){
    echo "Votre nom ou mot de passe est incorrect.";
    return;
}

$is_valid_password = password_verify(strip_tags($postData["user_password"]), $queryResult['user_password']);
$user_name = strip_tags($queryResult["user_name"]); // pas sûre

if($is_valid_password == true) {
    session_start();
    $_SESSION["LOGGED_USER"] = [
        "name" => $queryResult['user_name'],
        "user_id" => $queryResult['user_id'],
    ];
    header("Location: ../Code/Html/message-login.php");  // on en met un ou pas
    exit();
}
else{
    echo "Votre nom ou mot de passe est incorrect.";
}