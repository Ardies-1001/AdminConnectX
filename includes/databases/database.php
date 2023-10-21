<?php
include ('config.php');
# connexion a la base donnée
try {	
$db = new PDO('mysql:host='.$db['host'].'; dbname='.$db['name'], $db['user'], $db['password']);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch (PDOException $e) {
echo "ERREUR DE CONNEXION A LA BASE DE DONNEE !";
die();
}
