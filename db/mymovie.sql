SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mymovie` ;
USE `mymovie` ;

-- -----------------------------------------------------
-- Table `mymovie`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`address` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `address_line_1` VARCHAR(80) NULL ,
  `address_line_2` VARCHAR(80) NULL ,
  `city` VARCHAR(45) NULL ,
  `state` VARCHAR(45) NULL ,
  `pincode` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'address table' ;


-- -----------------------------------------------------
-- Table `mymovie`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`user` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(80) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `address_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id` )
    REFERENCES `mymovie`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `login_UNIQUE` ON `mymovie`.`user` (`login` ASC) ;

CREATE INDEX `fk_user_address1` ON `mymovie`.`user` (`address_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`audience`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`audience` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`audience` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`movie` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`movie` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `language` VARCHAR(45) NULL ,
  `duration` TINYINT NULL ,
  `audience_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_movie_audience1`
    FOREIGN KEY (`audience_id` )
    REFERENCES `mymovie`.`audience` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_audience1` ON `mymovie`.`movie` (`audience_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`genre` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`genre` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`actor` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`actor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `firstname` VARCHAR(45) NULL ,
  `lastname` VARCHAR(45) NULL ,
  `gender` VARCHAR(45) NULL ,
  `popularity` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `mymovie`.`actor` (`id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`theatre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`theatre` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`theatre` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  `Address line 1` VARCHAR(45) NULL ,
  `Address Line 2` VARCHAR(45) NULL ,
  `City` VARCHAR(45) NULL ,
  `State` VARCHAR(45) NULL ,
  `Pincode` INT NULL ,
  `Phoneno` VARCHAR(45) NULL ,
  `rating` TINYINT NULL ,
  `Ismultiplex` TINYINT(1)  NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`class` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`class` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`audi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`audi` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`audi` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`movie_runs_in_theatres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`movie_runs_in_theatres` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`movie_runs_in_theatres` (
  `movie_id` INT NULL ,
  `theatre_id` INT NULL ,
  `audi_id` INT NULL COMMENT '	' ,
  `class_id` INT NULL ,
  `date` DATETIME NULL ,
  `show_timings_id` INT NULL )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`show_timings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`show_timings` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`show_timings` (
  `id` INT NOT NULL ,
  `time` TIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`sellable_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`sellable_status` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`sellable_status` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`inventory` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`inventory` (
  `id` INT NOT NULL ,
  `movie_id` INT NULL ,
  `theater_id` INT NULL ,
  `audi_id` INT NULL ,
  `class_id` INT NULL ,
  `date` DATETIME NULL ,
  `show_timings_id` INT NULL ,
  `baseprice` FLOAT NULL ,
  `sellable_status_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_inventory_movie1`
    FOREIGN KEY (`movie_id` )
    REFERENCES `mymovie`.`movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_theatre1`
    FOREIGN KEY (`theater_id` )
    REFERENCES `mymovie`.`theatre` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_audi1`
    FOREIGN KEY (`audi_id` )
    REFERENCES `mymovie`.`audi` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_class1`
    FOREIGN KEY (`class_id` )
    REFERENCES `mymovie`.`class` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_show_timings2`
    FOREIGN KEY (`show_timings_id` )
    REFERENCES `mymovie`.`show_timings` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_sellable_status1`
    FOREIGN KEY (`sellable_status_id` )
    REFERENCES `mymovie`.`sellable_status` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_inventory_movie1` ON `mymovie`.`inventory` (`movie_id` ASC) ;

CREATE INDEX `fk_inventory_theatre1` ON `mymovie`.`inventory` (`theater_id` ASC) ;

CREATE INDEX `fk_inventory_audi1` ON `mymovie`.`inventory` (`audi_id` ASC) ;

CREATE INDEX `fk_inventory_class1` ON `mymovie`.`inventory` (`class_id` ASC) ;

CREATE INDEX `fk_inventory_sellable_status1` ON `mymovie`.`inventory` (`sellable_status_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`seat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`seat` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`seat` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`theater_audi_class_seat_mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`theater_audi_class_seat_mapping` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`theater_audi_class_seat_mapping` (
  `id` INT NOT NULL ,
  `theater_id` INT NULL ,
  `audi_id` INT NULL ,
  `class_id` INT NULL ,
  `seat_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_theater_audi_class_seat_mapping_theatre1`
    FOREIGN KEY (`theater_id` )
    REFERENCES `mymovie`.`theatre` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_theater_audi_class_seat_mapping_audi1`
    FOREIGN KEY (`audi_id` )
    REFERENCES `mymovie`.`audi` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_theater_audi_class_seat_mapping_class1`
    FOREIGN KEY (`class_id` )
    REFERENCES `mymovie`.`class` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_theater_audi_class_seat_mapping_seat1`
    FOREIGN KEY (`seat_id` )
    REFERENCES `mymovie`.`seat` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_theater_audi_class_seat_mapping_theatre1` ON `mymovie`.`theater_audi_class_seat_mapping` (`theater_id` ASC) ;

CREATE INDEX `fk_theater_audi_class_seat_mapping_audi1` ON `mymovie`.`theater_audi_class_seat_mapping` (`audi_id` ASC) ;

CREATE INDEX `fk_theater_audi_class_seat_mapping_class1` ON `mymovie`.`theater_audi_class_seat_mapping` (`class_id` ASC) ;

CREATE INDEX `fk_theater_audi_class_seat_mapping_seat1` ON `mymovie`.`theater_audi_class_seat_mapping` (`seat_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`review_status(`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`review_status(` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`review_status(` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`user_movie_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`user_movie_review` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`user_movie_review` (
  `id` INT NOT NULL ,
  `user_id` INT NULL ,
  `movie_id` INT NULL ,
  `title` VARCHAR(45) NULL ,
  `review` TEXT NULL ,
  `star_rating` TINYINT NULL ,
  `review_status_id` INT NULL ,
  `review_date` DATE NULL ,
  `publish_date` DATE NULL ,
  `publisher_user_id` INT NULL ,
  `review_status(_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `review_status(_id`) ,
  CONSTRAINT `fk_user_movie_review_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mymovie`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_movie_review_movie1`
    FOREIGN KEY (`movie_id` )
    REFERENCES `mymovie`.`movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_movie_review_review_status(1`
    FOREIGN KEY (`review_status(_id` )
    REFERENCES `mymovie`.`review_status(` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_movie_review_user1` ON `mymovie`.`user_movie_review` (`user_id` ASC) ;

CREATE INDEX `fk_user_movie_review_movie1` ON `mymovie`.`user_movie_review` (`movie_id` ASC) ;

CREATE INDEX `fk_user_movie_review_review_status(1` ON `mymovie`.`user_movie_review` (`review_status(_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`user_theatre_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`user_theatre_review` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`user_theatre_review` (
  `id` INT NOT NULL ,
  `user_id` INT NULL ,
  `theatre_id` INT NULL ,
  `star_rating_comfort` TINYINT NULL ,
  `star_rating_food` TINYINT NULL ,
  `star_rating_cleanliness` TINYINT NULL ,
  `star_rating_overall_experience` TINYINT NULL ,
  `title` VARCHAR(45) NULL ,
  `review` TEXT NULL ,
  `review_status_id` INT NULL ,
  `review_date` DATE NULL ,
  `publish_date` DATE NULL ,
  `publisher_user_id` INT NULL ,
  `review_status(_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `review_status(_id`) ,
  CONSTRAINT `fk_user_theatre_review_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mymovie`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_theatre_review_theatre1`
    FOREIGN KEY (`theatre_id` )
    REFERENCES `mymovie`.`theatre` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_theatre_review_review_status(1`
    FOREIGN KEY (`review_status(_id` )
    REFERENCES `mymovie`.`review_status(` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_theatre_review_user1` ON `mymovie`.`user_theatre_review` (`user_id` ASC) ;

CREATE INDEX `fk_user_theatre_review_theatre1` ON `mymovie`.`user_theatre_review` (`theatre_id` ASC) ;

CREATE INDEX `fk_user_theatre_review_review_status(1` ON `mymovie`.`user_theatre_review` (`review_status(_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`role` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`role` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`order1_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`order1_status` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`order1_status` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`payment_mode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`payment_mode` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`payment_mode` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`payment_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`payment_status` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`payment_status` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymovie`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`payment` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`payment` (
  `id` INT NOT NULL ,
  `amount` FLOAT NULL ,
  `payment_status_id` INT NULL ,
  `order1_id` INT NULL ,
  `payment_date` DATETIME NULL ,
  `IP` VARCHAR(45) NULL ,
  `payment_mode_id` INT NOT NULL ,
  `payment_status_id1` INT NOT NULL ,
  PRIMARY KEY (`id`, `payment_mode_id`, `payment_status_id1`) ,
  CONSTRAINT `fk_payment_payment_mode1`
    FOREIGN KEY (`payment_mode_id` )
    REFERENCES `mymovie`.`payment_mode` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_payment_status1`
    FOREIGN KEY (`payment_status_id1` )
    REFERENCES `mymovie`.`payment_status` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_payment_payment_mode1` ON `mymovie`.`payment` (`payment_mode_id` ASC) ;

CREATE INDEX `fk_payment_payment_status1` ON `mymovie`.`payment` (`payment_status_id1` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`order1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`order1` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`order1` (
  `id` INT NOT NULL ,
  `user_id` INT NULL ,
  `movie_id` INT NULL ,
  `theatre_id` INT NULL ,
  `date` DATE NULL ,
  `show_timings_id` INT NULL ,
  `order_status_id` INT NULL ,
  `payment_id` INT NULL ,
  `create_date` DATETIME NULL ,
  `order1_status_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `order1_status_id`) ,
  CONSTRAINT `fk_order1_order1_status1`
    FOREIGN KEY (`order1_status_id` )
    REFERENCES `mymovie`.`order1_status` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order1_payment1`
    FOREIGN KEY (`payment_id` )
    REFERENCES `mymovie`.`payment` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_order1_order1_status1` ON `mymovie`.`order1` (`order1_status_id` ASC) ;

CREATE INDEX `fk_order1_payment1` ON `mymovie`.`order1` (`payment_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`user_has_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`user_has_role` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`user_has_role` (
  `user_id` INT NOT NULL ,
  `role_id` INT NOT NULL ,
  PRIMARY KEY (`user_id`, `role_id`) ,
  CONSTRAINT `fk_user_has_role1_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mymovie`.`user` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_role1_role1`
    FOREIGN KEY (`role_id` )
    REFERENCES `mymovie`.`role` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_user_has_role1_role1` ON `mymovie`.`user_has_role` (`role_id` ASC) ;

CREATE INDEX `fk_user_has_role1_user1` ON `mymovie`.`user_has_role` (`user_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`movie_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`movie_has_genre` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`movie_has_genre` (
  `movie_id` INT NOT NULL ,
  `genre_id` INT NOT NULL ,
  PRIMARY KEY (`movie_id`, `genre_id`) ,
  CONSTRAINT `fk_movie_has_genre_movie1`
    FOREIGN KEY (`movie_id` )
    REFERENCES `mymovie`.`movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_genre_genre1`
    FOREIGN KEY (`genre_id` )
    REFERENCES `mymovie`.`genre` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_genre_genre1` ON `mymovie`.`movie_has_genre` (`genre_id` ASC) ;

CREATE INDEX `fk_movie_has_genre_movie1` ON `mymovie`.`movie_has_genre` (`movie_id` ASC) ;


-- -----------------------------------------------------
-- Table `mymovie`.`movie_has_actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mymovie`.`movie_has_actor` ;

CREATE  TABLE IF NOT EXISTS `mymovie`.`movie_has_actor` (
  `movie_id` INT NOT NULL ,
  `actor_id` INT NOT NULL ,
  PRIMARY KEY (`movie_id`, `actor_id`) ,
  CONSTRAINT `fk_movie_has_actor_movie1`
    FOREIGN KEY (`movie_id` )
    REFERENCES `mymovie`.`movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_actor_actor1`
    FOREIGN KEY (`actor_id` )
    REFERENCES `mymovie`.`actor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_actor_actor1` ON `mymovie`.`movie_has_actor` (`actor_id` ASC) ;

CREATE INDEX `fk_movie_has_actor_movie1` ON `mymovie`.`movie_has_actor` (`movie_id` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mymovie`.`audience`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`audience` (`id`, `name`) VALUES (1, 'A');
INSERT INTO `mymovie`.`audience` (`id`, `name`) VALUES (2, 'U/A');
INSERT INTO `mymovie`.`audience` (`id`, `name`) VALUES (3, 'U');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (1, 'Romance‎‎ ');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (2, 'Thriller‎‎ ');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (3, 'Crime');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (4, 'Action');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (5, 'Comedy');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (6, 'Sci-fi‎‎');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (7, 'Drama');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (8, 'Horror');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (9, 'Mystery');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (10, 'Social');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (11, 'Family');
INSERT INTO `mymovie`.`genre` (`id`, `name`) VALUES (12, 'Children');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`class`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`class` (`id`, `name`) VALUES (1, 'Gold');
INSERT INTO `mymovie`.`class` (`id`, `name`) VALUES (2, 'Silver');
INSERT INTO `mymovie`.`class` (`id`, `name`) VALUES (3, 'Platinum');
INSERT INTO `mymovie`.`class` (`id`, `name`) VALUES (4, 'Bronze');
INSERT INTO `mymovie`.`class` (`id`, `name`) VALUES (5, 'Premium');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`audi`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (1, 'Audi1');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (2, 'Audi2');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (3, 'Audi3');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (4, 'Audi4');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (5, 'Audi5');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (6, 'Audi6');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (7, 'Audi7');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (8, 'Audi8');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (9, 'Audi9');
INSERT INTO `mymovie`.`audi` (`id`, `name`) VALUES (100, 'Cineplex');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`sellable_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`sellable_status` (`id`, `name`) VALUES (1, 'available and can be sold by us');
INSERT INTO `mymovie`.`sellable_status` (`id`, `name`) VALUES (2, 'Not Available');
INSERT INTO `mymovie`.`sellable_status` (`id`, `name`) VALUES (3, 'available but locked by other order ');
INSERT INTO `mymovie`.`sellable_status` (`id`, `name`) VALUES (4, 'sold by us');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`review_status(`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`review_status(` (`id`, `name`) VALUES (1, 'Pending');
INSERT INTO `mymovie`.`review_status(` (`id`, `name`) VALUES (2, 'Published');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`role` (`id`, `name`) VALUES (1, 'ADMIN');
INSERT INTO `mymovie`.`role` (`id`, `name`) VALUES (2, 'Employee');
INSERT INTO `mymovie`.`role` (`id`, `name`) VALUES (3, 'verifieduser');
INSERT INTO `mymovie`.`role` (`id`, `name`) VALUES (4, 'unverifieduser');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`order1_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (1, 'InCart');
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (2, 'Placed');
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (3, 'In Process');
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (4, 'Shipped');
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (5, 'Delivered');
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (6, 'Lost');
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (7, 'Returned');
INSERT INTO `mymovie`.`order1_status` (`id`, `name`) VALUES (8, 'Cancelled');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`payment_mode`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`payment_mode` (`id`, `name`) VALUES (1, 'COD');
INSERT INTO `mymovie`.`payment_mode` (`id`, `name`) VALUES (2, 'NEFT');
INSERT INTO `mymovie`.`payment_mode` (`id`, `name`) VALUES (3, 'Cheque');
INSERT INTO `mymovie`.`payment_mode` (`id`, `name`) VALUES (4, 'Counter Cash');
INSERT INTO `mymovie`.`payment_mode` (`id`, `name`) VALUES (5, 'Tech Process');
INSERT INTO `mymovie`.`payment_mode` (`id`, `name`) VALUES (6, 'CC Avenue');
INSERT INTO `mymovie`.`payment_mode` (`id`, `name`) VALUES (7, 'Citrus');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mymovie`.`payment_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `mymovie`;
INSERT INTO `mymovie`.`payment_status` (`id`, `name`) VALUES (1, 'Requested');
INSERT INTO `mymovie`.`payment_status` (`id`, `name`) VALUES (2, 'Authorization Pending');
INSERT INTO `mymovie`.`payment_status` (`id`, `name`) VALUES (3, 'Success');
INSERT INTO `mymovie`.`payment_status` (`id`, `name`) VALUES (4, 'Failure');
INSERT INTO `mymovie`.`payment_status` (`id`, `name`) VALUES (5, 'Error');
INSERT INTO `mymovie`.`payment_status` (`id`, `name`) VALUES (6, 'Cancelled');
INSERT INTO `mymovie`.`payment_status` (`id`, `name`) VALUES (7, 'Refunded');

COMMIT;
