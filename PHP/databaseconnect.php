<?php

// infos sur la base de données
const MYSQL_HOST = 'localhost';
const MYSQL_PORT = 3306;
const MYSQL_NAME = 'Project_Club_Web';
const MYSQL_USER = 'root';
const MYSQL_PASSWORD = '';

// se connecter a la bd a l'aide des infos obtenues avant

try {
    $mysqlClient = new PDO(
        sprintf('mysql:host=%s;dbname=%s;port=%s;charset=utf8', MYSQL_HOST, MYSQL_NAME, MYSQL_PORT),
        MYSQL_USER,
        MYSQL_PASSWORD
    );
    $mysqlClient->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $exception) {
    die('Erreur : ' . $exception->getMessage());  // le getMessage jsp cmmt faire ou ou il est ?
}