<?php

/**
 * Gestion des catégories
 */

// on va récupérer les titres et ids des catégories
// en sortie ?array (on récupéré)
function selectCategoryForMenu(PDO $db): array|string|bool
{
    $sql ="SELECT id, title 
	FROM category 
    ORDER BY title ASC;";
    // exécution de la requête
    $stmt = $db->query($sql);

    // si pas de résultats
    if($stmt->rowCount()===0){
        // bonne pratique
        $stmt->closeCursor();
        // on renvoie null (?)
        return null;

    }

    // on a aumoins un resultat
    $resultats = $stmt->fetchAll();
    // bonne pratique 
    $stmt->closeCursor();

    // envoie du résultat
    return $resultats;

}