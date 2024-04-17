<?php

require_once "./vendor/autoload.php";
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
    ->select('p1.name AS player1', 's1.bezeichnung AS symbol1', 
            'r.date', 'r.time', 
            's2.bezeichnung AS symbol2', 'p2.name AS player2')
    ->from('round', 'r')
    ->join('r', 'player', 'p1', 'r.fk_player1 = p1.pk_id')
    ->join('r', 'player', 'p2', 'r.fk_player2 = p2.pk_id')
    ->join('r', 'symbol', 's1', 'r.fk_symbol1 = s1.pk_id')
    ->join('r', 'symbol', 's2', 'r.fk_symbol2 = s2.pk_id');

$results = $queryBuilder->fetchAllAssociative();

$row = file_get_contents('./row.html');

$template = file_get_contents('./template.html');

$keys = array_keys($results[0]);

$done = '';

//print_r($results);
//print($template);

for ($i = 0; $i < sizeof($results); $i++) {
    for ($j = 0; $j < sizeof($keys); $j++) {
        if ($j == 0) {
            $info = str_replace('{{ ' . $keys[$j] . ' }}', $results[$i][$keys[$j]], $row);
        } else {
            $info = str_replace('{{ ' . $keys[$j] . ' }}', $results[$i][$keys[$j]], $info);
        }
    }
    $done .= $info;
}

//echo $done;

$template = str_replace('{{ row }}', $done, $template);

echo $template;