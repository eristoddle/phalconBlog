SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `phalconblog` DEFAULT CHARACTER SET latin1 ;
USE `phalconblog` ;

-- -----------------------------------------------------
-- Table `phalconblog`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phalconblog`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(16) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `email` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `phalconblog`.`posts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phalconblog`.`posts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NOT NULL ,
  `title` TEXT NULL DEFAULT NULL ,
  `body` TEXT NULL DEFAULT NULL ,
  `excerpt` TEXT NULL DEFAULT NULL ,
  `published` DATETIME NULL DEFAULT NULL ,
  `updated` DATETIME NULL DEFAULT NULL ,
  `pinged` TEXT NULL DEFAULT NULL ,
  `to_ping` TEXT NULL DEFAULT NULL ,
  `users_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_posts_users` (`users_id` ASC) ,
  CONSTRAINT `fk_posts_users`
    FOREIGN KEY (`users_id` )
    REFERENCES `phalconblog`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `phalconblog`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phalconblog`.`comments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) NOT NULL ,
  `body` TEXT NOT NULL ,
  `name` TEXT NOT NULL ,
  `email` TEXT NOT NULL ,
  `url` TEXT NOT NULL ,
  `submitted` DATETIME NOT NULL ,
  `publish` TINYINT(1) NOT NULL ,
  `posts_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_comments_posts1` (`posts_id` ASC) ,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id` )
    REFERENCES `phalconblog`.`posts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `phalconblog`.`config`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phalconblog`.`config` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `config` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `phalconblog`.`tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phalconblog`.`tags` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tag` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `phalconblog`.`post_tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phalconblog`.`post_tags` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) NOT NULL ,
  `tag_id` INT(11) NOT NULL ,
  `tags_id` INT(11) NOT NULL ,
  `posts_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_post_tags_tags1` (`tags_id` ASC) ,
  INDEX `fk_post_tags_posts1` (`posts_id` ASC) ,
  CONSTRAINT `fk_post_tags_tags1`
    FOREIGN KEY (`tags_id` )
    REFERENCES `phalconblog`.`tags` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_tags_posts1`
    FOREIGN KEY (`posts_id` )
    REFERENCES `phalconblog`.`posts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
