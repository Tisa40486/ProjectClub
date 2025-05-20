<?php

require_once(__DIR__ . "/../Code/Html/createAccount.html");  // prend le dossier dans lequel tu te situes (le DIR)
require_once(__DIR__ . "/databaseconnect.php");

$postData = $_POST;


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

$userExist = $mysqlClient->prepare('SELECT  COUNT(user_name) as user_count FROM Utilisateurs WHERE user_name = :name');
$userExist->execute([
    'name' => $postData["user_name"]]);
$queryResult = $userExist->fetch();

if($queryResult['user_count'] > 0){
    echo "Ce nom est déjà utilisé";
    return;
}


$user_name = strip_tags($postData["user_name"]);
$user_password = password_hash(strip_tags($postData["user_password"]), PASSWORD_DEFAULT);

// Requete qui insert le user-name et le mdp
$insertUser = $mysqlClient -> prepare("INSERT INTO Utilisateurs (user_name, user_password) VALUES (:user_name, :user_password)");
$insertUser ->execute([
    "user_name" => $user_name,
    "user_password" => $user_password
]);



header("../Code/Html/message-bienvenue.html");  // met ou pas
exit();

?>