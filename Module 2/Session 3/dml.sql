INSERT INTO `customers`
  (`name`, `phone`)
VALUES
  ('Jono', +6285612542343), 
  ('Joni', +6281645634534),
  ('Sasa', +6285649304575), 
  ('Sisi', +6286617385038),
  ('Tono', +6281612938293), 
  ('Toni', +6282239939936);

INSERT INTO `items`
  (`name`, `price`)
VALUES
  ('Rice', 4000), 
  ('Fried Chicken', 6000),
  ('Fried Catfish', 7000), 
  ('Fried Egg', 2000),
  ('Fried Duck', 8000), 
  ('Fried Tempe', 2000);

INSERT INTO `orders`
  (`customer_id`, `date`)
VALUES
  (1, '2020-05-29'),
  (2, '2020-05-29'),
  (1, '2020-05-30'),
  (3, '2020-05-31'),
  (4, '2020-05-31'),
  (5, '2020-06-01');

INSERT INTO `order_details`
  (`order_id`, `item_id`, `qty`)
VALUES
  (1, 1, 1),
  (1, 5, 1),
  (2, 1, 2),
  (1, 6, 5),
  (3, 3, 2),
  (3, 1, 1),
  (4, 6, 3),
  (4, 1, 1),
  (5, 6, 3),
  (5, 1, 2),
  (5, 4, 1);