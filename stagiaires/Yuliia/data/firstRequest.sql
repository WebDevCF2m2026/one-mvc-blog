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
SELECT u.`id`, u.`realname`, a.`id` AS idarticle, a.`title` -- AS pour alias de sortie
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