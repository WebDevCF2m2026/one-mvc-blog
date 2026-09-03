<?php
# formateur/model/CategoryModel.php

/**
 * Gestion des catégories
 */

// on va récupérer les titres et ids des catégories pour créer le menu
// en sortie ?array (on récupère soit null soit un tableau ?array)
function selectCategoryForMenu(PDO $db): ?array
{
    // requête sql
    $sql = "SELECT `id`, `title` 
	        FROM `category` 
            ORDER BY `title` ASC;";

    // exécution de la requête        
    $stmt = $db->query($sql);  

    // si pas de résultats
    if($stmt->rowCount()===0){
         // bonne pratique
         $stmt->closeCursor();
         // on renvoie null (?)
         return null;
    }

    // on a au moins un résultat
    $resultats = $stmt->fetchAll();
    // bonne pratique 
    $stmt->closeCursor();

    // envoie du résultat
    return $resultats;


}