--1) Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "addresses".id = "addresses".customer_id;

--2) Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".product_id;

--3) Which warehouses have cheetos?
SELECT "warehouse".warehouse, "products".description FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id;

--4) Which warehouses have diet pepsi?
SELECT "warehouse".warehouse, "products".description FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id;

--5) Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.*, COUNT(orders.id) FROM customers 
JOIN addresses ON customers.id = addresses.customer_id 
JOIN orders ON orders.address_id = addresses.id GROUP BY customers.id;

--6) How many customers do we have?
SELECT count(*) FROM "customers";


--7) How many products do we carry?
SELECT count(*) FROM "products";


--8) What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) FROM "products"
JOIN "warehouse_product" ON "warehouse_product".product_id = "products".id
WHERE "products".id = 6;