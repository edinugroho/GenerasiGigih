CREATE DATABASE `food_oms_db`

CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT '0',
  PRIMARY KEY (`id`)
);

CREATE TABLE `item_categories` (
  `item_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL
);