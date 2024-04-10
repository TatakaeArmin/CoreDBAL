<?php

require_once "../vendor/autoload.php";
use Doctrine\DBAL\DriverManager;


$connectionParams = [
    'dbname' => 'tournaments',
    'user' => 'root',
    'password' => '',
    'host' => 'localhost',
    'driver' => 'pdo_mysql'
];
$conn = DriverManager::getConnection($connectionParams);

$queryBuilder = $conn->createQueryBuilder();

$queryBuilder
    ->select('bezeichnung')
    ->from('symbol');

$results = $queryBuilder->fetchAllAssociative();