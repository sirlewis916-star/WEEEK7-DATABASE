-- Drop tables if they already exist (to re-run safely)
DROP TABLE IF EXISTS OrderItems_2NF;
DROP TABLE IF EXISTS Orders_2NF;
DROP TABLE IF EXISTS ProductDetail_1NF;
GO
  
-- QUESTION 1: First Normal Form (1NF)
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);
GO

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');
GO

-- Verify Q1
SELECT * FROM ProductDetail_1NF;
GO


-- QUESTION 2: Second Normal Form (2NF)
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);
GO

CREATE TABLE OrderItems_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);
GO

INSERT INTO Orders_2NF (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');
GO

INSERT INTO OrderItems_2NF (OrderID, Product, Quantity) VALUES
(101, 'Mouse', 1),
(101, 'Keyboard', 3),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
GO

-- Verify Q2
SELECT * FROM Orders_2NF;
SELECT * FROM OrderItems_2NF;
GO
