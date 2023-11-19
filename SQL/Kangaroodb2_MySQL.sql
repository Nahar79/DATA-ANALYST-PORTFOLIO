-- Create the kangroo database
CREATE DATABASE kangroodb2;

-- Switch to the kangroo database
USE kangroodb2;

CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantName VARCHAR(100) NOT NULL,
    Address VARCHAR(200)
);

select * from restaurants;

INSERT INTO restaurants (RestaurantID, RestaurantName, Address)
VALUES
    (1, 'Delicious Diner', '123 Main St, London'),
    (2, 'Tasty Tavern', '456 Elm St, Manchester'),
    (3, 'Savory Eats', '789 Oak St, Birmingham'),
    (4, 'Yummy Cafe', '555 Maple St, Liverpool'),
    (5, 'Flavorful Bistro', '777 Pine St, Glasgow'),
    (6, 'Taste of Edinburgh', '999 High St, Edinburgh'),
    (7, 'Mexican Grill', '888 Broad St, Leeds'),
    (8, 'Italian Trattoria', '777 Market St, Sheffield'),
    (9, 'Healthy Bites', '444 Green St, Bristol'),
    (10, 'BBQ Joint', '222 Red St, Newcastle'),
    (11, 'Spice Palace', '333 Spice St, Cardiff'),
    (12, 'Ocean View Restaurant', '555 Sea St, Southampton'),
    (13, 'Cozy Corner Cafe', '111 Cozy St, Brighton'),
    (14, 'Riverside Eatery', '666 Riverside St, York'),
    (15, 'Charming Brasserie', '888 Charm St, Oxford');
    
    select * from restaurants; 

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    UNIQUE (Email)
);


    
    
select * from restaurants;

drop table customers;

-- Populating Customers table with sample data
INSERT INTO customers (CustomerID, LastName, FirstName, Email, PhoneNumber)
VALUES
  (1, 'Anderson', 'John', 'john.anderson@example.com', '07555-1234'),
  (2, 'Sainani', 'Roshika', 'roshika.sainani@example.com', '07555-5678'),
  (3, 'Williams', 'Michael', 'michael.williams@outlook.com', '07555-9876'),
  (4, 'Brown', 'Jessica', 'jessica.brown@example.com', '07555-4321'),
  (5, 'Jones', 'David', 'david.jones@yahoo.com', '07555-8765'),
  (6, 'Davis', 'Sophia', 'sophia.davis@examail.com', '07555-3456'),
  (7, 'Miller', 'Ethan', 'ethan.miller@example.com', '07555-7890'),
  (8, 'Wilson', 'Olivia', 'olivia.wilson@example.com', '07555-6543'),
  (9, 'Moore', 'Liam', 'liam.moore@example.com', '07555-2345'),
  (10, 'Taylor', 'Ava', 'ava.taylor@example.com', '07555-9087'),
  (11, 'Anderson', 'Noah', 'noah.anderson@example.com', '07555-5671'),
  (12, 'Thomas', 'Emma', 'emma.thomas@example.com', '07555-1238'),
  (13, 'Jackson', 'William', 'william.jackson@example.com', '07555-8762'),
  (14, 'White', 'Sofia', 'sofia.white@example.com', '07555-3412'),
  (15, 'Harris', 'James', 'james.harris@example.com', '07555-9081');


SELECT * FROM Customers
WHERE CustomerID IN (1, 3, 8, 11);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) DEFAULT 0.00,
    Email VARCHAR(100) UNIQUE,
    ManagerID INT,
    LicenseNumber VARCHAR(50) UNIQUE,
    IssueDate DATE,
    CountryOfIssue VARCHAR(50),
    ExpiryDate DATE,
    FOREIGN KEY (ManagerID) REFERENCES Drivers(DriverID) ON DELETE SET NULL
);

INSERT INTO Drivers (Name, Salary, Email, ManagerID, LicenseNumber, IssueDate, CountryOfIssue, ExpiryDate)
VALUES
    ('Michael Anderson', 2500.00, 'michael.anderson@example.com', 1, 'DL12345', '2020-01-15', 'UK', '2025-01-15'),
    ('Sophia Williams', 2300.00, 'sophia.williams@example.com', 1, 'DL67890', '2019-05-20', 'US', '2024-05-20'),
    ('James Smith', 2200.00, 'james.smith@example.com', 3, 'DL98765', '2018-08-10', 'UK', '2023-08-10'),
    ('Emma Johnson', 2400.00, 'emma.johnson@example.com', 2, 'DL54321', '2022-02-25', 'CA', '2027-02-25'),
    ('David Brown', 2100.00, 'david.brown@example.com', 3, 'DL45678', '2017-07-05', 'AU', '2022-07-05'),
    ('Olivia Jones', 2600.00, 'olivia.jones@example.com', 5, 'DL87654', '2021-04-18', 'NZ', '2026-04-18'),
    ('William Davis', 2000.00, 'william.davis@example.com', 5, 'DL23456', '2016-03-12', 'UK', '2021-03-12'),
    ('Ava Wilson', 2300.00, 'ava.wilson@example.com', 4, 'DL76543', '2015-11-30', 'US', '2020-11-30'),
    ('Liam Garcia', 2400.00, 'liam.garcia@example.com', 3, 'DL78901', '2019-09-23', 'CA', '2024-09-23'),
    ('Sophie Martinez', 2100.00, 'sophie.martinez@example.com', 2, 'DL01234', '2018-06-14', 'AU', '2023-06-14'),
    ('Noah Lee', 2500.00, 'noah.lee@example.com', 1, 'DL89012', '2020-12-08', 'NZ', '2025-12-08'),
    ('Isabella Clark', 2200.00, 'isabella.clark@example.com', 3, 'DL34567', '2017-10-03', 'UK', '2022-10-03');

SELECT * FROM drivers;

SELECT ManagerID, COUNT(*) AS AssignedDriversCount
FROM Drivers
WHERE ManagerID = '3'
GROUP BY ManagerID;

SELECT Name, Salary, Email, ManagerID
FROM Drivers
WHERE Salary > 2300.00;


CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    RegistrationNumber VARCHAR(50) UNIQUE,
    Color VARCHAR(50),
    PurchaseDate DATE,
    EngineSize VARCHAR(20),
    DriverID INT,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE SET NULL
);

INSERT INTO Vehicles (RegistrationNumber, Color, PurchaseDate, EngineSize, DriverID)
VALUES
    ('ABC123', 'Blue', '2022-03-10', '250cc', 1),
    ('XYZ789', 'Red', '2021-08-20', '200cc', 2),
    ('DEF456', 'Green', '2020-05-15', '150cc', 3),
    ('GHI789', 'Black', '2019-10-08', '180cc', 4),
    ('JKL012', 'Silver', '2022-01-05', '220cc', 5),
    ('MNO345', 'White', '2021-06-30', '190cc', 6),
    ('PQR678', 'Yellow', '2020-11-25', '210cc', 7),
    ('STU901', 'Purple', '2018-04-14', '170cc', 8),
    ('VWX234', 'Orange', '2017-09-09', '160cc', 9),
    ('YZA567', 'Gray', '2019-02-28', '200cc', 10),
    ('BCD890', 'Brown', '2022-07-17', '180cc', 11),
    ('EFG123', 'Pink', '2018-12-03', '140cc', 12);

select * from vehicles;

CREATE TABLE Items (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100) NOT NULL,
    ItemPrice DECIMAL(10, 2) DEFAULT 0.00,
    Category VARCHAR(50)
);
INSERT INTO Items (ItemID, ItemName, ItemPrice, Category)
VALUES
    (1, 'Garlic Bread', 3.50, 'Starter'),
    (2, 'Pizza Margherita', 10.99, 'Main Course'),
    (3, 'Chocolate Cake', 5.99, 'Dessert'),
    (4, 'Coke', 1.99, 'Drink'),
    (5, 'Chicken Wings', 7.50, 'Starter'),
    (6, 'Pasta Carbonara', 12.99, 'Main Course'),
    (7, 'Ice Cream Sundae', 6.49, 'Dessert'),
    (8, 'Orange Juice', 2.49, 'Drink'),
    (9, 'Bruschetta', 4.75, 'Starter'),
    (10, 'Steak with Fries', 16.99, 'Main Course'),
    (11, 'Tiramisu', 7.25, 'Dessert'),
    (12, 'Lemonade', 1.75, 'Drink'),
    (13, 'Caprese Salad', 6.25, 'Starter');

select * from items;

SELECT Category, COUNT(*) AS TotalItems FROM Items
GROUP BY Category;

SELECT Category, AVG(ItemPrice) AS AvgPrice FROM Items
GROUP BY Category;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    CustomerID INT,
    DriverID INT,
    RestaurantID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE SET NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID) ON DELETE SET NULL
);

INSERT INTO Orders (OrderID, OrderDate, CustomerID, DriverID, RestaurantID)
VALUES
    (1, '2023-08-01', 1, 1, 1),
    (2, '2023-08-02', 2, 2, 2),
    (3, '2023-08-03', 3, 3, 3),
    (4, '2023-08-04', 4, 4, 4),
    (5, '2023-08-05', 5, 5, 5),
    (6, '2023-08-06', 6, 6, 6),
    (7, '2023-08-07', 7, 7, 7),
    (8, '2023-08-08', 8, 8, 8),
    (9, '2023-08-09', 9, 9, 9),
    (10, '2023-08-10', 10, 10, 10);

SELECT
    o.OrderID,
    o.OrderDate,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    d.Name AS DriverName,
    r.RestaurantName
FROM
    Orders o
JOIN
    Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN
    Drivers d ON o.DriverID = d.DriverID
JOIN
    Restaurants r ON o.RestaurantID = r.RestaurantID;

CREATE TABLE OrderItems (
    OrderID INT,
    ItemID INT,
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID) ON DELETE CASCADE
);

INSERT INTO OrderItems (OrderID, ItemID)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 3),
    (3, 4),
    (4, 4),
    (4, 1),
    (5, 1),
    (5, 2),
    (6, 3),
    (6, 4),
    (7, 2),
    (7, 3),
    (8, 4);

SELECT
    r.RestaurantID,
    r.RestaurantName,
    SUM(i.ItemPrice) AS TotalRevenue
FROM
    Orders o
JOIN
    Restaurants r ON o.RestaurantID = r.RestaurantID
JOIN
    OrderItems oi ON o.OrderID = oi.OrderID
JOIN
    Items i ON oi.ItemID = i.ItemID
GROUP BY
    r.RestaurantID, r.RestaurantName;
    
    
    SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID AS RecentOrderID,
    o.OrderDate AS RecentOrderDate,
    r.RestaurantName AS RecentRestaurant
FROM
    Customers c
LEFT JOIN
    (
        SELECT
            OrderID,
            CustomerID,
            OrderDate,
            RestaurantID
        FROM
            Orders o1
        WHERE
            OrderDate = (
                SELECT MAX(OrderDate)
                FROM Orders o2
                WHERE o1.CustomerID = o2.CustomerID
            )
    ) o ON c.CustomerID = o.CustomerID
LEFT JOIN
    Restaurants r ON o.RestaurantID = r.RestaurantID;


CREATE TABLE Managers (
    ManagerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DriverID INT,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE SET NULL
);

INSERT INTO Managers (Name, Email, DriverID)
VALUES
    ('John Manager', 'john.manager@example.com', 1), 
    ('Emily Manager', 'emily.manager@example.com', 2),
    ('Sarah Manager', 'sarah.manager@example.com', 3), 
    ('Daniel Manager', 'daniel.manager@example.com', 4), 
    ('Alice Manager', 'alice.manager@example.com', 5), 
    ('Liam Manager', 'liam.manager@example.com', 6), 
    ('Sophie Manager', 'sophie.manager@example.com', 7), 
    ('Ava Manager', 'ava.manager@example.com', 8), 
    ('Noah Manager', 'noah.manager@example.com', 9), 
    ('Isabella Manager', 'isabella.manager@example.com', 10), 
    ('Ethan Manager', 'ethan.manager@example.com', 11), 
    ('Mia Manager', 'mia.manager@example.com', 12); 

SELECT
    m.ManagerID,
    m.Name AS ManagerName,
    COUNT(d.DriverID) AS TotalDrivers
FROM
    Managers m
LEFT JOIN
    Drivers d ON m.ManagerID = d.ManagerID
GROUP BY
    m.ManagerID, m.Name
ORDER BY
    TotalDrivers DESC;

SELECT
    m.ManagerID,
    m.Name AS ManagerName,
    AVG(d.Salary) AS AvgSalary
FROM
    Managers m
LEFT JOIN
    Drivers d ON m.ManagerID = d.ManagerID
GROUP BY
    m.ManagerID, m.Name
ORDER BY
    AvgSalary DESC;
    
    SELECT
    d.DriverID,
    d.Name AS DriverName,
    COUNT(o.OrderID) AS TotalOrders
FROM
    Drivers d
LEFT JOIN
    Orders o ON d.DriverID = o.DriverID
GROUP BY
    d.DriverID, d.Name
ORDER BY
    TotalOrders DESC;
    
    
   SELECT
    c.FirstName,
    c.LastName,
    i.ItemName AS SuggestedItem
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderItems oi ON o.OrderID = oi.OrderID
JOIN
    Items i ON oi.ItemID = i.ItemID
WHERE
    c.CustomerID = 5;

SELECT
    i.ItemName,
    COUNT(oi.ItemID) AS TotalOrders
FROM
    OrderItems oi
JOIN
    Items i ON oi.ItemID = i.ItemID
JOIN
    Orders o ON oi.OrderID = o.OrderID
WHERE
    DATE(o.OrderDate) = CURDATE;



SELECT
    r.City,
    COUNT(o.OrderID) AS TotalOrders
FROM
    Restaurants r
LEFT JOIN
    Orders o ON r.RestaurantID = o.RestaurantID
WHERE
    DATE(o.OrderDate) BETWEEN '2023-08-23' AND '2023-09-15'
GROUP BY
    r.City;    
    
-- Checking restaurant details
SELECT RestaurantName, Address
FROM Restaurants
WHERE RestaurantID = 9;

-- Adding a new restaurant
INSERT INTO Restaurants (RestaurantName, Address)
VALUES ('New Restaurant', '123 New Street');

-- Adding a new item to the menu
INSERT INTO Items (ItemName, ItemPrice, Category)
VALUES ('New Item', 8.99, 'Main Course');

-- Average delivery time per driver
SELECT d.Name AS DriverName, AVG(o.DeliveryTime) AS AvgDeliveryTime
FROM Drivers d
LEFT JOIN Orders o ON d.DriverID = o.DriverID
GROUP BY d.Name;

-- Number of orders per restaurant
SELECT r.RestaurantName, COUNT(o.OrderID) AS TotalOrders
FROM Restaurants r
LEFT JOIN Orders o ON r.RestaurantID = o.RestaurantID
GROUP BY r.RestaurantName;

-- Restricting access to customer personal information
SELECT FirstName, LastName, Email
FROM Customers
WHERE CustomerID = 8;

-- Restricting access to customer personal information
SELECT FirstName, LastName, Email
FROM Customers
WHERE CustomerID = [AuthorizedCustomerID];

-- Restricting access to financial data
SELECT DriverID, Name, Salary
FROM Drivers
WHERE DriverID = [AuthorizedManagerID];

-- Restricting access to financial data
SELECT DriverID, Name, Salary
FROM Drivers
WHERE DriverID = [AuthorizedManagerID];

SELECT
    o.OrderID,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    d.Name AS DriverName,
    r.RestaurantName,
    o.OrderDate,
    o.EstimatedDeliveryTime
FROM
    Orders o
JOIN
    Customers c ON o.CustomerID = c.CustomerID
JOIN
    Drivers d ON o.DriverID = d.DriverID
JOIN
    Restaurants r ON o.RestaurantID = r.RestaurantID
WHERE
    o.DeliveryStatus = 'Pending';
    
    SELECT
    HOUR(OrderDate) AS OrderHour,
    COUNT(OrderID) AS TotalOrders
FROM
    Orders
WHERE
    DeliveryStatus = 'Pending'
GROUP BY
    OrderHour
ORDER BY
    TotalOrders DESC
LIMIT 1;

select * from managers;