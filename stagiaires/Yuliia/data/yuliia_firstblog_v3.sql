-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema yuliia_firstblog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `yuliia_firstblog` ;

-- -----------------------------------------------------
-- Schema yuliia_firstblog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yuliia_firstblog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `yuliia_firstblog` ;

-- -----------------------------------------------------
-- Table `yuliia_firstblog`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yuliia_firstblog`.`user` ;

CREATE TABLE IF NOT EXISTS `yuliia_firstblog`.`user` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID unique unsigned auto increment, not NULL ',
  `login` VARCHAR(30) NOT NULL COMMENT 'login unique mais case sensitive (ADMIN != Admin)\ncs case sensitive \nci case insensitive',
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'Mot de passe hash, avec 255 max, case sensitive, actuellemnt 60',
  `email` VARCHAR(120) NULL COMMENT 'email ulitaseur',
  `actif` TINYINT UNSIGNED NULL DEFAULT 2 COMMENT '0 => actif\n1 => banni\n2 => non active\n3 => RGPD avec article anonymes\n4 => RGPD avec article cachés',
  `realname` VARCHAR(100) NULL,
  `uniqid` VARCHAR(80) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuliia_firstblog`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yuliia_firstblog`.`article` ;

CREATE TABLE IF NOT EXISTS `yuliia_firstblog`.`article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(80) NULL,
  `content` TEXT NOT NULL,
  `datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ou now(), temps actuel si non ',
  `actif` TINYINT UNSIGNED NULL COMMENT '0 => non visible\n1 => visible \n2 => article caché',
  `user_id` SMALLINT UNSIGNED NOT NULL COMMENT 'clef étrangaire qui fait le lien avec la table user',
  PRIMARY KEY (`id`),
  INDEX `fk_article_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_article_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `yuliia_firstblog`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuliia_firstblog`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yuliia_firstblog`.`category` ;

CREATE TABLE IF NOT EXISTS `yuliia_firstblog`.`category` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(60) NOT NULL,
  `description` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuliia_firstblog`.`category_has_article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yuliia_firstblog`.`category_has_article` ;

CREATE TABLE IF NOT EXISTS `yuliia_firstblog`.`category_has_article` (
  `category_id` SMALLINT UNSIGNED NOT NULL,
  `article_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`category_id`, `article_id`),
  INDEX `fk_category_has_article_article1_idx` (`article_id` ASC) VISIBLE,
  INDEX `fk_category_has_article_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_has_article_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `yuliia_firstblog`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_category_has_article_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `yuliia_firstblog`.`article` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
