CREATE TABLE Customers (
    customer_id INT,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    price INT
);

CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO Customers VALUES
(1,'Amit','Chennai'),
(2,'Riya','Salem'),
(3,'John','Bangalore');

INSERT INTO Products VALUES
(101,'Laptop',50000),
(102,'Phone',20000),
(103,'Tablet',15000);

INSERT INTO Orders VALUES
(1,1,101,1),
(2,2,102,2),
(3,3,103,3),
(4,1,102,1);

QUERY SQL

SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM Customers
WHERE city = 'Salem';

SELECT * FROM Products
ORDER BY price DESC;

SELECT customer_id, SUM(quantity) AS total_quantity
FROM Orders
GROUP BY customer_id;

SELECT Customers.name, Products.product_name, Orders.quantity
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Products ON Orders.product_id = Products.product_id;

SELECT SUM(quantity) AS total_products_sold
FROM Orders;