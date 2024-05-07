<?php

$conn = require "./connection.php";

$queryBuilder = $conn->createQueryBuilder();

if (intval($_POST['round'])) {
    $queryBuilder
        ->delete('round')
        ->where('pk_id = ' . $_POST['round']);

    $queryBuilder->executeQuery();
}


header("Location: index.php");
