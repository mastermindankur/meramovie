-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 11, 2012 at 07:20 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mymovie`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE IF NOT EXISTS `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `popularity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`id`, `firstname`, `lastname`, `gender`, `popularity`) VALUES
(1, 'John ', 'Cusack', 'male', NULL),
(2, 'Jeffrey Dean ', 'Morgan', 'male', NULL),
(3, 'Franka ', 'Potente', 'male', NULL),
(4, 'Ken ', 'Watanabe', 'female', NULL),
(5, ' Yun-Fat Chow', NULL, 'male', NULL),
(6, 'Li Gong', NULL, 'female', NULL),
(7, ' Rinko  ', 'Kikuchi', 'female', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(80) DEFAULT NULL,
  `address_line_2` varchar(80) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='address table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `address`
--


-- --------------------------------------------------------

--
-- Table structure for table `audi`
--

CREATE TABLE IF NOT EXISTS `audi` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audi`
--

INSERT INTO `audi` (`id`, `name`) VALUES
(1, 'Audi1'),
(2, 'Audi2'),
(3, 'Audi3'),
(4, 'Audi4'),
(5, 'Audi5'),
(6, 'Audi6'),
(7, 'Audi7'),
(8, 'Audi8'),
(9, 'Audi9'),
(100, 'Cineplex');

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE IF NOT EXISTS `audience` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audience`
--

INSERT INTO `audience` (`id`, `name`) VALUES
(1, 'A'),
(2, 'U/A'),
(3, 'U');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(1, 'Gold'),
(2, 'Silver'),
(3, 'Platinum'),
(4, 'Bronze'),
(5, 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Romance'),
(2, 'Thriller?? '),
(3, 'Crime'),
(4, 'Action'),
(5, 'Comedy'),
(6, 'Sci-fi??'),
(7, 'Drama'),
(8, 'Horror'),
(9, 'Mystery'),
(10, 'Social'),
(11, 'Family'),
(12, 'Children');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `audi_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `show_timings_id` int(11) DEFAULT NULL,
  `baseprice` float DEFAULT NULL,
  `sellable_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inventory_show_timings2` (`show_timings_id`),
  KEY `fk_inventory_movie1` (`movie_id`),
  KEY `fk_inventory_theatre1` (`theater_id`),
  KEY `fk_inventory_audi1` (`audi_id`),
  KEY `fk_inventory_class1` (`class_id`),
  KEY `fk_inventory_sellable_status1` (`sellable_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--


-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `duration` tinyint(4) DEFAULT NULL,
  `audience_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movie_audience1` (`audience_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `name`, `language`, `duration`, `audience_id`) VALUES
(1, 'Shanghai', 'English', 2, 1),
(2, 'Prometheus 3D', 'English', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `movie_has_actor`
--

CREATE TABLE IF NOT EXISTS `movie_has_actor` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`actor_id`),
  KEY `fk_movie_has_actor_actor1` (`actor_id`),
  KEY `fk_movie_has_actor_movie1` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_has_actor`
--

INSERT INTO `movie_has_actor` (`movie_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 4),
(1, 5),
(2, 5),
(1, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `movie_has_genre`
--

CREATE TABLE IF NOT EXISTS `movie_has_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `fk_movie_has_genre_genre1` (`genre_id`),
  KEY `fk_movie_has_genre_movie1` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_has_genre`
--

INSERT INTO `movie_has_genre` (`movie_id`, `genre_id`) VALUES
(2, 1),
(2, 4),
(1, 7),
(1, 9),
(2, 9),
(2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `movie_runs_in_theatres`
--

CREATE TABLE IF NOT EXISTS `movie_runs_in_theatres` (
  `movie_id` int(11) DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL,
  `audi_id` int(11) DEFAULT NULL COMMENT '	',
  `class_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `show_timings` varchar(200) DEFAULT NULL,
  KEY `fk_movie1` (`movie_id`),
  KEY `fk_theatre1` (`theatre_id`),
  KEY `fk_audi1` (`audi_id`),
  KEY `fk_class1` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_runs_in_theatres`
--

INSERT INTO `movie_runs_in_theatres` (`movie_id`, `theatre_id`, `audi_id`, `class_id`, `date`, `show_timings`) VALUES
(1, 5, 2, 2, '2012-06-08 14:48:25', '10:30am 1pm'),
(1, 2, 2, 3, '2012-06-08 14:55:42', '11 am 12 pm 4 pm'),
(2, 3, 5, 5, '2012-06-08 15:04:12', '7am 8am 9am 12 pm 5:30pm 8:pm');

-- --------------------------------------------------------

--
-- Table structure for table `order1`
--

CREATE TABLE IF NOT EXISTS `order1` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `show_timings_id` int(11) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `order1_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`order1_status_id`),
  KEY `fk_order1_order1_status1` (`order1_status_id`),
  KEY `fk_order1_payment1` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order1`
--


-- --------------------------------------------------------

--
-- Table structure for table `order1_status`
--

CREATE TABLE IF NOT EXISTS `order1_status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order1_status`
--

INSERT INTO `order1_status` (`id`, `name`) VALUES
(1, 'InCart'),
(2, 'Placed'),
(3, 'In Process'),
(4, 'Shipped'),
(5, 'Delivered'),
(6, 'Lost'),
(7, 'Returned'),
(8, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `payment_status_id` int(11) DEFAULT NULL,
  `order1_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `payment_mode_id` int(11) NOT NULL,
  `payment_status_id1` int(11) NOT NULL,
  PRIMARY KEY (`id`,`payment_mode_id`,`payment_status_id1`),
  KEY `fk_payment_payment_mode1` (`payment_mode_id`),
  KEY `fk_payment_payment_status1` (`payment_status_id1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE IF NOT EXISTS `payment_mode` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`id`, `name`) VALUES
(1, 'COD'),
(2, 'NEFT'),
(3, 'Cheque'),
(4, 'Counter Cash'),
(5, 'Tech Process'),
(6, 'CC Avenue'),
(7, 'Citrus');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE IF NOT EXISTS `payment_status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `name`) VALUES
(1, 'Requested'),
(2, 'Authorization Pending'),
(3, 'Success'),
(4, 'Failure'),
(5, 'Error'),
(6, 'Cancelled'),
(7, 'Refunded');

-- --------------------------------------------------------

--
-- Table structure for table `review_status(`
--

CREATE TABLE IF NOT EXISTS `review_status(` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_status(`
--

INSERT INTO `review_status(` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Published');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'Employee'),
(3, 'verifieduser'),
(4, 'unverifieduser');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE IF NOT EXISTS `seat` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seat`
--


-- --------------------------------------------------------

--
-- Table structure for table `sellable_status`
--

CREATE TABLE IF NOT EXISTS `sellable_status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sellable_status`
--

INSERT INTO `sellable_status` (`id`, `name`) VALUES
(1, 'available and can be sold by us'),
(2, 'Not Available'),
(3, 'available but locked by other order '),
(4, 'sold by us');

-- --------------------------------------------------------

--
-- Table structure for table `show_timings`
--

CREATE TABLE IF NOT EXISTS `show_timings` (
  `id` int(11) NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `show_timings`
--


-- --------------------------------------------------------

--
-- Table structure for table `theater_audi_class_seat_mapping`
--

CREATE TABLE IF NOT EXISTS `theater_audi_class_seat_mapping` (
  `id` int(11) NOT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `audi_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_theater_audi_class_seat_mapping_theatre1` (`theater_id`),
  KEY `fk_theater_audi_class_seat_mapping_audi1` (`audi_id`),
  KEY `fk_theater_audi_class_seat_mapping_class1` (`class_id`),
  KEY `fk_theater_audi_class_seat_mapping_seat1` (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theater_audi_class_seat_mapping`
--


-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE IF NOT EXISTS `theatre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Address line 1` varchar(45) DEFAULT NULL,
  `Address Line 2` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Pincode` int(11) DEFAULT NULL,
  `Phoneno` varchar(45) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `Ismultiplex` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`id`, `Name`, `Address line 1`, `Address Line 2`, `City`, `State`, `Pincode`, `Phoneno`, `rating`, `Ismultiplex`) VALUES
(1, 'Cinemax Pacific Mall: Subhash Nagar', 'Shubash Nagar', NULL, 'Delhi', 'Delhi', 110027, NULL, NULL, 1),
(2, 'G3s Cinema: Rohini', 'Rohini', 'Rohini', 'Delhi', 'Delhi', 110034, NULL, NULL, 1),
(3, 'Dt City Centre: Shalimar Bagh', 'Shalimar Bagh', 'Shalimar Bagh', 'Delhi', 'Delhi', 110034, NULL, NULL, 1),
(4, 'Pvr Select Citywalk ', 'Primere', NULL, 'Delhi', 'Delhi', NULL, NULL, NULL, 1),
(5, 'Pvr Gurgaon Mainstream', 'Gurgaon', NULL, 'Gurgaon', 'Haryana', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(80) NOT NULL,
  `password` varchar(45) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_user_address1` (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `address_id`) VALUES
(1, 'admin', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_role`
--

CREATE TABLE IF NOT EXISTS `user_has_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_has_role1_role1` (`role_id`),
  KEY `fk_user_has_role1_user1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_has_role`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_movie_review`
--

CREATE TABLE IF NOT EXISTS `user_movie_review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `review` text,
  `star_rating` tinyint(4) DEFAULT NULL,
  `review_status_id` int(11) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publisher_user_id` int(11) DEFAULT NULL,
  `review_status(_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`review_status(_id`),
  KEY `fk_user_movie_review_user1` (`user_id`),
  KEY `fk_user_movie_review_movie1` (`movie_id`),
  KEY `fk_user_movie_review_review_status(1` (`review_status(_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_movie_review`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_theatre_review`
--

CREATE TABLE IF NOT EXISTS `user_theatre_review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL,
  `star_rating_comfort` tinyint(4) DEFAULT NULL,
  `star_rating_food` tinyint(4) DEFAULT NULL,
  `star_rating_cleanliness` tinyint(4) DEFAULT NULL,
  `star_rating_overall_experience` tinyint(4) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `review` text,
  `review_status_id` int(11) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publisher_user_id` int(11) DEFAULT NULL,
  `review_status(_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`review_status(_id`),
  KEY `fk_user_theatre_review_user1` (`user_id`),
  KEY `fk_user_theatre_review_theatre1` (`theatre_id`),
  KEY `fk_user_theatre_review_review_status(1` (`review_status(_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_theatre_review`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_audi1` FOREIGN KEY (`audi_id`) REFERENCES `audi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inventory_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inventory_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inventory_sellable_status1` FOREIGN KEY (`sellable_status_id`) REFERENCES `sellable_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inventory_show_timings2` FOREIGN KEY (`show_timings_id`) REFERENCES `show_timings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inventory_theatre1` FOREIGN KEY (`theater_id`) REFERENCES `theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `fk_movie_audience1` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movie_has_actor`
--
ALTER TABLE `movie_has_actor`
  ADD CONSTRAINT `fk_movie_has_actor_actor1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movie_has_actor_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movie_has_genre`
--
ALTER TABLE `movie_has_genre`
  ADD CONSTRAINT `fk_movie_has_genre_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movie_has_genre_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movie_runs_in_theatres`
--
ALTER TABLE `movie_runs_in_theatres`
  ADD CONSTRAINT `fk_audi1` FOREIGN KEY (`audi_id`) REFERENCES `audi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_theatre1` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order1`
--
ALTER TABLE `order1`
  ADD CONSTRAINT `fk_order1_order1_status1` FOREIGN KEY (`order1_status_id`) REFERENCES `order1_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order1_payment1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_payment_mode1` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_mode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_payment_payment_status1` FOREIGN KEY (`payment_status_id1`) REFERENCES `payment_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `theater_audi_class_seat_mapping`
--
ALTER TABLE `theater_audi_class_seat_mapping`
  ADD CONSTRAINT `fk_theater_audi_class_seat_mapping_audi1` FOREIGN KEY (`audi_id`) REFERENCES `audi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_theater_audi_class_seat_mapping_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_theater_audi_class_seat_mapping_seat1` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_theater_audi_class_seat_mapping_theatre1` FOREIGN KEY (`theater_id`) REFERENCES `theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_role`
--
ALTER TABLE `user_has_role`
  ADD CONSTRAINT `fk_user_has_role1_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_has_role1_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_movie_review`
--
ALTER TABLE `user_movie_review`
  ADD CONSTRAINT `fk_user_movie_review_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_movie_review_review_status(1` FOREIGN KEY (`review_status(_id`) REFERENCES `review_status(` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_movie_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_theatre_review`
--
ALTER TABLE `user_theatre_review`
  ADD CONSTRAINT `fk_user_theatre_review_review_status(1` FOREIGN KEY (`review_status(_id`) REFERENCES `review_status(` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_theatre_review_theatre1` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_theatre_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
