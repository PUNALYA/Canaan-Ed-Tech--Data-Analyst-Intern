CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price INTEGER
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    order_date TEXT
);

INSERT INTO Customers VALUES
(1,'Amit','Chennai'),
(2,'Riya','Salem'),
(3,'John','Bangalore'),
(4,'Sneha','Chennai'),
(5,'Karan','Coimbatore');

INSERT INTO Products VALUES
(101,'Laptop','Electronics',50000),
(102,'Phone','Electronics',20000),
(103,'Tablet','Electronics',15000),
(104,'Shoes','Fashion',3000),
(105,'Watch','Accessories',5000);

INSERT INTO Orders VALUES
(1,1,101,1,'2026-02-01'),
(2,2,102,2,'2026-02-02'),
(3,3,103,1,'2026-02-03'),
(4,1,104,2,'2026-02-04'),
(5,4,105,1,'2026-02-05'),
(6,5,101,1,'2026-02-06'),
(7,2,103,3,'2026-02-07'),
(8,3,102,1,'2026-02-08'),
(9,4,104,2,'2026-02-09'),
(10,5,105,2,'2026-02-10');

QUERY SQL

SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

#4. Total Revenue of Store
SELECT SUM(Products.price * Orders.quantity) AS total_revenue
FROM Orders
JOIN Products ON Orders.product_id = Products.product_id;

#5. Total Sales Per Customer
SELECT Customers.name,
SUM(Products.price * Orders.quantity) AS total_spent
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Products ON Orders.product_id = Products.product_id
GROUP BY Customers.name;

#6. Highest Selling Product (By Quantity)
SELECT Products.product_name,
SUM(Orders.quantity) AS total_quantity
FROM Orders
JOIN Products ON Orders.product_id = Products.product_id
GROUP BY Products.product_name
ORDER BY total_quantity DESC
LIMIT 1;

#7. Customers (Chennai)
SELECT * FROM Customers
WHERE city = 'Chennai';

#8. Orders After 2026-02-05
SELECT * FROM Orders
WHERE order_date > '2026-02-05';

#9. Total Orders Per City
SELECT Customers.city,
COUNT(Orders.order_id) AS total_orders
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
GROUP BY Customers.city;

#10. Most Expensive Product
SELECT * FROM Products
ORDER BY price DESC
LIMIT 1;

#11. Category Wise Revenue
SELECT Products.category,
SUM(Products.price * Orders.quantity) AS revenue
FROM Orders
JOIN Products ON Orders.product_id = Products.product_id
GROUP BY Products.category;