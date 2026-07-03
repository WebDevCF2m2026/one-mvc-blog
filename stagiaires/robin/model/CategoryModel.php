<?php

# stagiaires\robin\model\CategoryModel.php

/*
* Gestion des catégories 
*/

// On va récupérer les titres et ids des catégories pour créer le menu
// En sortie ?array (on récupère soit null soit un tableau ?array)

function selectCategoryForMenu(PDO $db): ?array 
{   
    // Requête sql
    $sql = "SELECT `id`, `title` 
	        FROM `category`
            ORDER BY `title` ASC;";

    // Exécution de la requête        
    $stmt = $db->query($sql);

    // Si pas de résultats
    if($stmt->rowCount()===0){
        // Bonne pratique
       $stmt->closeCursor();
        // On renvoie null (?)
       return null;
    }

    return [];

    // Si on a au moins un résultat
    $resultats = $stmp->fetchAll();
    // Bonne pratique 
    $stmt->closeCursor();
    // Envoie du résultat
    return $resultats;

}