<?php
# stagiaires\robin\controller\routerController.php


/*
 Routage, ce contrôleur va charger
 les données et les vues suivant les
 urls reçues (GET)
*/

/* 
 Appel des dépendances
*/


// Appel du gestionnaire de category
require_once BASE_URL."/model/CategoryModel.php";


/* On a besoin d'une connexion MySQL 
pour toutes nos pages, on va donc l'ouvrir
ici */

try{
    $connexion = new PDO(
        dsn:DB_DSN,
        username:DB_LOGIN,
        password:DB_PWD,
        options:[
            # activation de l'affichage des erreurs
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            # on ne récupère les données qu'au format tableau associatif
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
}catch(Exception $e){
    // Arrêt du script et affichage de l'erreur
    die($e->getMessage());
}


/* homepage */


// Gestion des données

// Récupération des catégory pour le menu

$menu = selectCategoryForMenu($connexion);

// Appel de la vue
require_once BASE_URL."/view/homepage.html.php";

// bonne pratique, fermeture de connexion
$connection = null;