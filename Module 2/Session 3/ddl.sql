CREATE TABLE `customers` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),
  `phone` varchar(15)
);

CREATE TABLE `items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),
  `price` int(20)
);

CREATE TABLE `orders` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `customer_id` int,
  `date` date
);

CREATE TABLE `order_details` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `item_id` int,
  `qty` int(20)
);

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

ALTER TABLE `order_details` ADD FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

ALTER TABLE `order_details` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);