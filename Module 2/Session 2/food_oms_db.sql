-- food_oms_db

CREATE TABLE items (
    id INT NOT NULL,
    name VARCHAR(50) DEFAULT NULL,
    price INT DEFAULT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE item_categories (
    item_id INT
    category_id INT
);

CREATE TABLE categories (id INT);
ALTER TABLE categories ADD PRIMARY KEY(id);
ALTER TABLE categories ADD name VARCHAR(50);

INSERT INTO items(id, name, price) VALUES (1, 'Nasi Goreng', 15000);
INSERT INTO items(id, name, price) VALUES (2, 'Air Putih');
INSERT INTO items(id, name, price) VALUES (4, 'Green Tea Latte', 18000);

ALTER TABLE items MODIFY id INT NOT NULL auto_increment;

INSERT INTO items(name, price) VALUES ('Green Tea Latte', 18000);

-- 1
select items.id, items.name, items.price, categories.name from item_categories 
right join items  
on items.id = item_categories.item_id  
left join categories  
on categories.id = item_categories.category_id;

-- 2
select items.id, items.name, items.price, categories.name from item_categories 
right join items 
on items.id = item_categories.item_id 
left join categories 
on categories.id = item_categories.category_id 
where categories.name = 'main dish';

-- 3
select items.id, items.name, items.price from item_categories 
right join items 
on items.id = item_categories.item_id 
left join categories 
on categories.id = item_categories.category_id 
where categories.name = 'main dish' and items.price > 30000;

-- 4
select items.id, items.name, items.price from item_categories  
right join items  
on items.id = item_categories.item_id  
left join categories  
on categories.id = item_categories.category_id  
where item_categories.category_id is null;
