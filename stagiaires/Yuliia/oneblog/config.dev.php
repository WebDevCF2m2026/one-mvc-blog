<?php

/**
 * config.dev.php à dupliquer et renommer en
 * config.php en production
 */

// création des constantes de connexion
const DB_TYPE = "mysql";
const DB_HOST = "localhost";
const DB_PORT = 3306;
const DB_NAME = "oneblog";
const DB_CHARSET = "utf8";
const DB_LOGIN = "root";
const DB_PWD = "";

// préparation de la connexion
const DB_DSN = DB_TYPE.":host=".DB_HOST.";dbname=".DB_NAME.";port=".DB_PORT.";charset=".DB_CHARSET.";";

// chemin racine du projet
const BASE_URL = __DIR__;
