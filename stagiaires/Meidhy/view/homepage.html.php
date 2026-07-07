<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="OneBlog | Accueil de mon blog" />
        <meta name="author" content="Tanuki-Sempaï" />
        <title>One Blog | Homepage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
<body>

     <?php include_once BASE_URL."/view/include/menu.public.html.php" ?>

        <div class="container">
            <div class="text-center mt-5">
                <h1>OneBlog | Accueil</h1>
                <p class="lead">Page d'accueil de mon blog</p>
            </div>
        </div>

        <?php 
        // si pas d'articles 
        if (empty($articles)):
        ?>
        <h3>Pas encore d'article</h3>
        <?php 
        // sinon au moins un article 
        else:
            // on va compter le nombre d'articles 
            $count = count($articles);
            // on ajoute le pluriel si plus d'un 
            $pluriel = ($count>1)? "s": "";
        ?>

            <h4>Il y a <?= $count ?> article<?=$pluriel?></h4>
        <?php 
        endif;
        ?>
        
        <!-- Bootstrap core JS-->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    
    <?php var_dump($connection,$articles, $menu)?>
</body>
</html>