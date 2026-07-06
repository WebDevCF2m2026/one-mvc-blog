<?php
# stagiaires/Yuliia/oneblog/model/CategoryModel.php

/**
 * Gestion de catégory
 */

// on va récupérer les titres et ids des catégories pour crées le menu
// en sortie ?array (on récupère soit null soit un tableau ?array)
// $db -> $connection renomé
function selectCategoryFromMenu(PDO $db): ?array
{
    // requete sql
    $sql = "SELECT `id`,`title`
            FROM `category`
            ORDER BY `title` ASC;";

    // exécution de la requete
    $stmt = $db->query($sql);

    // si pas de resultats 
    if ($stmt->rowCount() === 0) {
        // bonne pratique
        $stmt->closeCursor();
        // on renvoi null (?)
        return null;
    }

    // on a au mois un résultat
    $resultats = $stmt->fetchAll();
    //bonne pratique 
    $stmt->closeCursor();

    // on envoi du résultat
    return $resultats;
}
