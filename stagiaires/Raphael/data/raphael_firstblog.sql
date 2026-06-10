-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema raphael_firstblog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `raphael_firstblog` ;

-- -----------------------------------------------------
-- Schema raphael_firstblog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `raphael_firstblog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `raphael_firstblog` ;

-- -----------------------------------------------------
-- Table `raphael_firstblog`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `raphael_firstblog`.`user` ;

CREATE TABLE IF NOT EXISTS `raphael_firstblog`.`user` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID unique unsigned auto increment',
  `login` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'login unique mais case sensitive (ADMIN != Admin)\ncs case sensitive\nci case insensitive',
  `realname` VARCHAR(100) NULL COMMENT 'NULL : non obligatoire',
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'mot de passe hash(empreinte), avec 255 max, case sensitive, actuellement 60',
  `email` VARCHAR(120) NOT NULL COMMENT 'email utilisateur',
  `actif` TINYINT UNSIGNED NOT NULL DEFAULT 2 COMMENT '0 => actif\n1 => banni\n2 => non actif\n3 => RGPD avec articles anonymes\n4 => RGPD avec articles cachés\n',
  `uniqid` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
