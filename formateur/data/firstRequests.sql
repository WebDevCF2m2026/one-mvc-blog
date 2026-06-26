SELECT * FROM `article`;
SELECT * FROM `category`;
SELECT * FROM `user`;
# Sélectionner le titre de la table article en ajoutant le login de la table utilisateur (jointure obligatoire) sans alias
SELECT `article`.`title`, `user`.`login` 
	FROM `article`
    JOIN `user`
    	ON `article`.`user_id` = `user`.id;
# Sélectionner le titre de la table article en ajoutant le login de la table utilisateur (jointure obligatoire) avec alias
SELECT a.`title`, u.`login` 
	FROM `article` a -- alias de table
    JOIN `user` u
    	ON a.`user_id` = u.id;       
# Sélectionner l'id et le realname de la table user en ajoutant l'id renommé idarticle et le title de la table article (jointure obligatoire) avec alias 
SELECT u.`id`, u.`realname`, 
	   a.`id` AS idarticle, a.`title` -- AS pour alias de sortie
	FROM `user` u
    JOIN `article` a
    	ON a.`user_id` = u.`id`;
        
# Sélectionner l'id et le realname de la table user en ajoutant l'id renommé idarticle et le title de la table article (jointure obligatoire) avec alias. On veut ajouter le title renommé categtitle de la catégorie de l'article sélectionné. # Jointure obligatoire 
SELECT  u.`id`, u.`realname`,
		a.`id` AS idarticle, a.`title`, -- AS pour alias de sortie
        c.`title` AS categtitle
		
	FROM `user` u
    JOIN `article` a
    	ON a.`user_id` = u.`id`
    LEFT JOIN `category_has_article`h   
    	ON a.`id` = h.`article_id`
    LEFT JOIN `category` c 
    	ON h.`category_id` = c.`id`;
        
# Sélectionner l'id et le realname de la table user en ajoutant l'id renommé idarticle et le title de la table article (jointure obligatoire) avec alias. On veut ajouter l'id renommé en idcateg ,le title renommé categtitle de la catégorie de l'article sélectionné. # Jointure externe gauche
SELECT  u.`id`, u.`realname`,
		a.`id` AS idarticle, a.`title`, -- AS pour alias de sortie
        GROUP_CONCAT(c.`id`) AS idcateg,
        GROUP_CONCAT(c.`title` SEPARATOR '_♥_') AS categtitle
		
	FROM `user` u
    JOIN `article` a
    	ON a.`user_id` = u.`id`
    LEFT JOIN `category_has_article`h   
    	ON a.`id` = h.`article_id`
    LEFT JOIN `category` c 
    	ON h.`category_id` = c.`id`
    GROUP BY u.`id`    ;    
    
    
# Sélectionner l'id et le realname, ainsi que 250 caractères (250 bytes réels) de la table user en ajoutant l'id renommé idarticle et le title de la table article (jointure obligatoire) avec alias. On veut ajouter le title renommé categtitle de la catégorie de l'article sélectionné. Jointure externe (LEFT JOIN non obligatoire) entre article et catégories
SELECT  u.`id`, u.`realname`,
		a.`id` AS idarticle, a.`title`, LEFT(a.`content`,250) AS `content`, -- AS pour alias de sortie, LEFT pour couper content pour éviter un texte trop long
        c.`title` AS categtitle
		
	FROM `user` u
    INNER JOIN `article` a
    	ON a.`user_id` = u.`id`
    LEFT JOIN `category_has_article`h   
    	ON a.`id` = h.`article_id`
    LEFT JOIN `category` c 
    	ON h.`category_id` = c.`id`;    
        
        
# Fonctionnel
        SELECT u.`id`, u.`realname`,
    GROUP_CONCAT(a.`id` SEPARATOR '_|♥|_') AS idarticle, GROUP_CONCAT(a.`title` SEPARATOR '_|♥|_') AS title, GROUP_CONCAT(LEFT(a.`content`, 250) SEPARATOR '_|♥|_') AS content,
    GROUP_CONCAT(
        (
            SELECT CONCAT(GROUP_CONCAT(c.`id` SEPARATOR ',' ), "|||" , GROUP_CONCAT(c.`title` SEPARATOR '_|♥|_'),"___")
            FROM `category` c 
            INNER JOIN `category_has_article` h ON c.`id` = h.`category_id`
            WHERE h.`article_id` = a.`id`
        )
        SEPARATOR '_|♥|_'
    ) AS categ
FROM `user` u
LEFT JOIN `article` a ON a.`user_id` = u.`id`
GROUP BY u.`id`;
    
# PAGE d'accueil    

## On récupère tous les champs id et le title de la table category ordonné par title ASC

SELECT id, title 
	FROM category 
    ORDER BY title ASC;