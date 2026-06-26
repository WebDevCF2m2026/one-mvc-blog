-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 21 juin 2026 à 05:13
-- Version du serveur : 8.4.7
-- Version de PHP : 8.4.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `michael_firstblog`
--
DROP DATABASE IF EXISTS `michael_firstblog`;
CREATE DATABASE IF NOT EXISTS `michael_firstblog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `michael_firstblog`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `content` text NOT NULL,
  `datetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'ou now(), temps actuel si non renseigné',
  `actif` tinyint DEFAULT '0' COMMENT '0 => non visible\n1 => visible\n2 =>  article caché',
  `user_id` smallint UNSIGNED NOT NULL COMMENT 'clef étrangère qui fait le lien avec la table user',
  PRIMARY KEY (`id`),
  KEY `fk_article_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `datetime`, `actif`, `user_id`) VALUES
(4, 'zzzzzzzzzzz', 'zzzzzzzzzz', '2026-06-10 11:06:11', 1, 1),
(5, 'yyyyyyyyyyy', 'yyyyyyyyyyyyyy', '2026-06-10 11:06:11', 0, 2),
(6, 'xxxxxxxxxxxxxx', 'xxxxxxxxxxxx', '2026-06-10 11:06:11', 2, 3),
(7, 'ddddddddddd', 'ddddddddddddddd', '2026-06-21 06:58:28', 1, 1),
(8, 'eeeeeeeeeee', 'eeeeeeeeeeeeeeeee eeeeeeeeeeeeee', '2026-06-21 06:59:07', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(1, 'categ1', 'categ1'),
(2, 'categ2', 'categ2'),
(3, 'categ3', 'categ3'),
(4, 'category4', 'category4');

-- --------------------------------------------------------

--
-- Structure de la table `category_has_article`
--

DROP TABLE IF EXISTS `category_has_article`;
CREATE TABLE IF NOT EXISTS `category_has_article` (
  `category_id` smallint UNSIGNED NOT NULL,
  `article_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`category_id`,`article_id`),
  KEY `fk_category_has_article_article1_idx` (`article_id`),
  KEY `fk_category_has_article_category1_idx` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category_has_article`
--

INSERT INTO `category_has_article` (`category_id`, `article_id`) VALUES
(1, 5),
(1, 6),
(1, 8),
(2, 8),
(3, 5),
(3, 6),
(3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID unique unsigned auto increment not null',
  `login` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'login unique mais case sentive ( ADMIN != Admin )   not null\ncs case sensitive\nci case insensitive',
  `realname` varchar(100) DEFAULT NULL COMMENT 'NULL : non obligatoire',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'Mot de passe hash (empreinte), avec 255 max, case sensitive, actuellement 60  not null',
  `email` varchar(120) NOT NULL COMMENT 'email utilisateur  not null',
  `actif` tinyint UNSIGNED DEFAULT '2' COMMENT '0 => actif\n1 => banni\n2 => non activé\n3 => RGPD avec articles anonymes\n4 => RGPD avec articles cachés',
  `uniqid` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `realname`, `pwd`, `email`, `actif`, `uniqid`) VALUES
(1, 'aaaa', 'aaaaaaaaa', 'aaaaaaaa', 'aaaaaaaaaa', 2, 'aaaaaaaaa'),
(2, 'bbbbbbbbbb', 'bbbbbbbbbb', 'bbbbbbbbbbb', 'bbbbbbbbbbb', 2, 'bbbbbbbbb'),
(3, 'cccccccc', 'cccccccccccc', 'cccccccccccc', 'ccccccccc', 2, 'cccccccccc'),
(4, 'dddddddddddddddd', 'ddddddddddd', 'dddddddddddddddd', 'dddddddddddddddd', 2, 'dddddddddddddd');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `category_has_article`
--
ALTER TABLE `category_has_article`
  ADD CONSTRAINT `fk_category_has_article_article1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_has_article_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
