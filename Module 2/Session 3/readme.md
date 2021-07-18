# Homework

## Case

Our food order management system database can now handle items data. But the client also needs to record customer orders. They want the customer name and phone (unique) to be recorded along with their purchases. So when they make an order, we can see who make the order, how much is the total price paid for one order, and the order date. Ther also want the order details recorded. winch items are bought in one order and how many (quantity of each item bought).

1. Define the additional entities and design the entity relationship diagram
2. Create tables that represent the entities
3. Insert minimal 5 dummy record for each entitiy
4. Display data winch contains all orders information, with their respective customer name and phone informations

## My Work

1. Entity relationship diagram
[erd](https://raw.githubusercontent.com/edinugroho/GenerasiGigih/main/Module%202/Session%203/erd.png?raw=true)
2. DDL
[Code](https://github.com/edinugroho/GenerasiGigih/blob/main/Module%202/Session%203/ddl.sql)
3. DML
[Code](https://github.com/edinugroho/GenerasiGigih/blob/main/Module%202/Session%203/ddl.sql)
4. Display all order information
```SELECT orders.id, orders.date, customers.name, customers.phone, SUM(items.price * order_details.qty) AS 'total', GROUP_CONCAT(items.name) AS 'Item bought'
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id
LEFT JOIN order_details
ON orders.id = order_details.order_id
LEFT JOIN items
ON order_details.item_id = items.id
WHERE order_details.item_id IS NOT null
GROUP BY order_details.order_id```
