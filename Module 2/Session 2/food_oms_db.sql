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