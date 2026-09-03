<?php
# formateur/model/ArticleModel.php

/**
 * Gestionnaire de la table Article
 */

/**
 * Sélection de tous les articles pour la page d'accueil
 */

function selectHomepageArticle(PDO $db): array
{
    // requête
    $sql = "SELECT  a.`id`, a.`title`, SUBSTRING(a.`content`,1, 200) AS `content`, a.`datetime`,
		u.`id` AS `iduser`, u.`login`, u.`realname`,
        GROUP_CONCAT(c.`id`) AS `idcategory`, GROUP_CONCAT(c.`title` SEPARATOR '_|♥|_') AS `titlecategory`
	FROM `article` a
    INNER JOIN `user` u 
    	ON a.`user_id` = u.`id`
    LEFT JOIN `category_has_article` h 
    	ON a.`id` = h.`article_id`
    LEFT JOIN `category` c
    	ON c.`id` = h.`category_id`
    WHERE a.`actif`= 1
    GROUP BY a.`id`
    ORDER BY a.`datetime` DESC;";
    // exécution de la requête
    $stmt = $db->query($sql);
    // récupération des articles
    $articles = $stmt->fetchAll();
    // bonne pratique
    $stmt->closeCursor();
    // envoi du résultat
    return $articles;
}

// Selection d'un article via son id 
// 
function selectArticleById(PDO $db, int $id): ?array
{
    $sql = "SELECT a.`id`, a.`title`, a.`content` AS `content`, a.`datetime`,
		u.`id` AS `iduser`, u.`login`, u.`realname`,
        GROUP_CONCAT(c.`id`) AS `idcategory`, GROUP_CONCAT(c.`title` SEPARATOR '_|♥|_') AS `titlecategory`
	FROM `article` a
    INNER JOIN `user` u 
    	ON a.`user_id` = u.`id`
    LEFT JOIN `category_has_article` h 
    	ON a.`id` = h.`article_id`
    LEFT JOIN `category` c
    	ON c.`id` = h.`category_id`
    WHERE a.`id` = ? AND a.`actif`= 1
    GROUP BY a.`id`
    ORDER BY a.`datetime` DESC;";

    // prepare, pas query
    $stmt = $db->prepare($sql);
    $stmt->execute([$id]);

    if($stmt->rowCount()===0){
        // on met la recupération
        $article = null ; 
    } 

    // Bonne pratique 
    $article = $stmt->fetch();
    $stmt->closeCursor();
    // Envoi du resultat
    return $article ?: null;
}



// Fonction qui va couper le texte en dehors des mots 
function cutTheText(string $text, int $long=200): string
{
    // On compte le nombre de caractères 
    $count = strlen($text);
    // si la longueur de caratère est < que $long 
    if($count <= $long) return $text;
    // On coupe à la longueur de length 
    $text = substr($text,0,$long);
    // On va trouver l'emplacement derniere caractère, 
    // si il y'en a dans le reste du texte  
    $lastSpace = strripos($text, " ");
    // On coupe au dernier espace trouvé 
    // On coupe à la longueur de length 
    $text = substr($text,0,$lastSpace);
    // retour du texte formaté 
    return $text; 
}

