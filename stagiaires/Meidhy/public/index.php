<?php
# formateur/public/index.php

/**
 * Contrôleur frontal, seul fichier accessible du site
 */

/**
 * Appel des dépendances
 */

// fichier de configuration
require_once "../config.php";

/**
 * Chargement du routeur
 */
require_once BASE_URL."/controller/routerController.php";
