<<<<<<< HEAD:stagiaires/README.md
# One MVC Blog

En PHP Procédural, structure MVC et base de donnée MySQL

## But

Nous allons faire un blog avec des utilisateurs, des articles et des rubriques

## Installation de WorkBench

https://dev.mysql.com/downloads/workbench/

## Principes de la structure MVC

![Schéma MVC](data/MVC.png)

- **Modèle (Model)** : C'est la partie qui gère les données et la logique métier de l'application. Il interagit avec la base de données pour récupérer, insérer, mettre à jour ou supprimer des données. Le modèle ne contient aucune logique de présentation.
- **Vue (View)** : C'est la partie qui gère la présentation des données. Elle est responsable de l'affichage des informations à l'utilisateur. La vue reçoit les données du modèle et les affiche de manière appropriée, souvent en utilisant du HTML, CSS et parfois du JavaScript.
- **Contrôleur (Controller)** : C'est la partie qui agit comme un intermédiaire entre le modèle et la vue. Le contrôleur reçoit les requêtes de l'utilisateur, interagit avec le modèle pour traiter les données, puis sélectionne la vue appropriée pour afficher les résultats à l'utilisateur.

## Les jointures SQL

![Schéma MVC](data/sql-joins.jpg)

Les jointures SQL permettent de combiner des données provenant de plusieurs tables en fonction d'une condition de correspondance. Il existe plusieurs types de jointures, notamment :

Voici les types de jointures les plus courants :
- **INNER JOIN** : Retourne les enregistrements qui ont des correspondances dans les deux tables. `jointure interne` signifie que seules les lignes qui ont des correspondances dans les deux tables seront incluses dans le résultat.
- **LEFT JOIN** : Retourne tous les enregistrements de la table de gauche et les enregistrements correspondants de la table de droite. Si aucune correspondance n'est trouvée, les résultats de la table de droite seront NULL. `jointure externe gauche` signifie que toutes les lignes de la table de gauche seront incluses dans le résultat, même si elles n'ont pas de correspondance dans la table de droite.
- **RIGHT JOIN** : Retourne tous les enregistrements de la table de droite et les enregistrements correspondants de la table de gauche. Si aucune correspondance n'est trouvée, les résultats de la table de gauche seront NULL. `jointure externe droite` signifie que toutes les lignes de la table de droite seront incluses dans le résultat, même si elles n'ont pas de correspondance dans la table de gauche.


## Les tables

### user

Table `user` :

`id` en SMALLINT, AUTO_INCREMENT, PRIMARY KEY, UNSIGNED, NOT NULL (2 octets, de 0 à 65535)

`login` en VARCHAR(30), NOT NULL (30 caractères maximum), UNIQUE

`pwd` en VARCHAR(255), NOT NULL (255 caractères maximum) pour un mot de passe haché. Suivez ce lien pour hacher le mot de passe https://onlinephp.io/c/ca27f



#### Documentation SQL

Les int : https://dev.mysql.com/doc/refman/9.7/en/integer-types.html
Les varchar : https://dev.mysql.com/doc/refman/9.7/en/string-types.html#varchar
=======
# One MVC Blog

En PHP Procédural, structure MVC et base de donnée MySQL

## But

Nous allons faire un blog avec des utilisateurs, des articles et des rubriques

## Installation de WorkBench

https://dev.mysql.com/downloads/workbench/

## Principes de la structure MVC

![Schéma MVC](data/MVC.png)

- **Modèle (Model)** : C'est la partie qui gère les données et la logique métier de l'application. Il interagit avec la base de données pour récupérer, insérer, mettre à jour ou supprimer des données. Le modèle ne contient aucune logique de présentation.
- **Vue (View)** : C'est la partie qui gère la présentation des données. Elle est responsable de l'affichage des informations à l'utilisateur. La vue reçoit les données du modèle et les affiche de manière appropriée, souvent en utilisant du HTML, CSS et parfois du JavaScript.
- **Contrôleur (Controller)** : C'est la partie qui agit comme un intermédiaire entre le modèle et la vue. Le contrôleur reçoit les requêtes de l'utilisateur, interagit avec le modèle pour traiter les données, puis sélectionne la vue appropriée pour afficher les résultats à l'utilisateur.

## Les jointures SQL

![Schéma MVC](data/sql-joins.jpg)

Les jointures SQL permettent de combiner des données provenant de plusieurs tables en fonction d'une condition de correspondance. Il existe plusieurs types de jointures, notamment :

Voici les types de jointures les plus courants :
- **INNER JOIN** : Retourne les enregistrements qui ont des correspondances dans les deux tables. `jointure interne` signifie que seules les lignes qui ont des correspondances dans les deux tables seront incluses dans le résultat.
- **LEFT JOIN** : Retourne tous les enregistrements de la table de gauche et les enregistrements correspondants de la table de droite. Si aucune correspondance n'est trouvée, les résultats de la table de droite seront NULL. `jointure externe gauche` signifie que toutes les lignes de la table de gauche seront incluses dans le résultat, même si elles n'ont pas de correspondance dans la table de droite.
- **RIGHT JOIN** : Retourne tous les enregistrements de la table de droite et les enregistrements correspondants de la table de gauche. Si aucune correspondance n'est trouvée, les résultats de la table de gauche seront NULL. `jointure externe droite` signifie que toutes les lignes de la table de droite seront incluses dans le résultat, même si elles n'ont pas de correspondance dans la table de gauche.


## Les tables

### user

Table `user` :

`id` en SMALLINT, AUTO_INCREMENT, PRIMARY KEY, UNSIGNED, NOT NULL (2 octets, de 0 à 65535)

`login` en VARCHAR(30), NOT NULL (30 caractères maximum), UNIQUE

`pwd` en VARCHAR(255), NOT NULL (255 caractères maximum) pour un mot de passe haché. Suivez ce lien pour hacher le mot de passe https://onlinephp.io/c/ca27f



#### Documentation SQL

Les int : https://dev.mysql.com/doc/refman/9.7/en/integer-types.html
Les varchar : https://dev.mysql.com/doc/refman/9.7/en/string-types.html#varchar


### Exportation dans Workbench

        EER Diagram > Database > Forward Engineer
>>>>>>> d7af94c97d5d9feec36dd27655713569f18df9c8:README.md
