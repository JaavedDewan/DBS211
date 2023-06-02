/******************************************************************************
* DBS211 - Project
* Winter 2023 
* Group members: 20
* Student 01
*   Fullname  : Jaaved Dewan
*   Student ID: 126045178
* Student 02
*   Fullname  : Sara Nasifa Zaman
*   Student ID: 172752214
* Student 03
*   Fullname  : Ishwinder Singh
*   Student ID: 175612217
*******************************************************************************
* PART II. PHYSICAL DATABASE MODEL 
*******************************************************************************/
-- Write all create statement to create the tables for Project 01 in this section.
-- You write four create statements.

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT NOT NULL,
    CustomerName VARCHAR(50) NOT NULL,
    CustomerAddress VARCHAR(50),
    CustomerCity VARCHAR(50),
    CustomerState VARCHAR(50),
    CustomerPostalCode VARCHAR(50),
    PRIMARY KEY (CustomerID)
);

-- Create Order table
CREATE TABLE Orders ( --"Order" doesn't work so "Orders" was used instead.
    OrderID INT NOT NULL,
    OrderDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
);

-- Create Order_Line table
CREATE TABLE Order_Line (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderedQuantity INT NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID)
        REFERENCES Product(ProductID)
);
-- Create Product table
CREATE TABLE Product (
    ProductID INT NOT NULL,
    ProductDescription VARCHAR(50) NOT NULL,
    ProductFinish VARCHAR(50),
    ProductStandardPrice int NOT NULL,
    ProductLineID INT NOT NULL,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductLineID)
        REFERENCES Product_Line(ProductLineID)
);

-- Create Product_Line table
CREATE TABLE Product_Line (
    ProductLineID INT NOT NULL,
    ProductLineName VARCHAR(50) NOT NULL,
    PRIMARY KEY (ProductLineID)
);



/******************************************************************************
* Part III. Data Manipulation 
*******************************************************************************/
--*********** Enter Data 
-- In this section, write all SQL statements to insert data to your tables.
-- You write four INSERT statements.

-- Customer Table
INSERT ALL
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (1, 'Contemporary Casuals', '1335 S Hines Blvd', 'Gainesville', 'FL', '32601-2871')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (2, 'Value Furniture', '14512 S.W. 17th St.', 'Plano', 'TX', '75094-7743')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (3, 'Home Furnishing', '1900 Allard Ave.', 'Albany', 'NY', '12209-1233')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (4, 'Easter Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-1231')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-2254')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (7, 'Period Furniture', '394 Rainbow Dr.', 'Seattle', 'WA', '97989-5648')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (8, 'California Classics', '816 Peach Rd.', 'Santa Clara', 'CA', '16915-7712')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (9, 'M and H Casual', '5585 South Ct.', 'Gainesville', 'FL', '12601-2873')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (10, 'Seminole Interior', '3225 Flatiron Cir.', 'Plano', 'TX', '25094-7746')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (11, 'American Euro Furniture', '5585 Eastcott Ct.', 'Albany', 'NY', '42209-1235')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (12, 'Battle Creek Furniture', '325 Flatry Dr.', 'Carteret', 'NJ', '67508-1235')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (13, 'Heritage Furniture', '5523 Fleming Dr.', 'Sacramento', 'CA', '84206-4055')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (14, 'Kaneohe Homes', '3215 Glatiron Dr.', 'Boulder', 'CO', '80514-2254')
  INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
    VALUES (15, 'Mountain Schemes', '455 Westgreen Dr.', 'Seattle', 'WA', '22989-5748')
SELECT * FROM dual;

-- Order Table

INSERT ALL
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1001, TO_DATE('1/21/2019', 'MM/DD/YYYY'), 1)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1002, TO_DATE('1/22/2019', 'MM/DD/YYYY'), 8)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1003, TO_DATE('1/24/2019', 'MM/DD/YYYY'), 15)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1004, TO_DATE('1/21/2019', 'MM/DD/YYYY'), 5)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1005, TO_DATE('1/25/2019', 'MM/DD/YYYY'), 3)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1006, TO_DATE('1/27/2019', 'MM/DD/YYYY'), 2)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1007, TO_DATE('2/11/2019', 'MM/DD/YYYY'), 11)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1008, TO_DATE('2/11/2019', 'MM/DD/YYYY'), 12)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1009, TO_DATE('2/27/2019', 'MM/DD/YYYY'), 4)
  INTO Orders (OrderID, OrderDate, CustomerID) VALUES (1010, TO_DATE('2/25/2019', 'MM/DD/YYYY'), 1)
SELECT 1 FROM dual;

-- Product Line Table

INSERT ALL
INTO Product_Line(ProductLineId, ProductLineName) VALUES (1, 'Product Line 1')
INTO Product_Line(ProductLineId, ProductLineName) VALUES (2, 'Product Line 2')
INTO Product_Line(ProductLineId, ProductLineName) VALUES (3, 'Product Line 3')
SELECT * FROM dual;

-- Product Table

INSERT ALL 
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (1, 'End Table', 'Cherry', 175, 1)
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (2, 'Coffee Table', 'Natural Ash', 170, 2)
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (3, 'Computer Desk', 'Natural Ash', 435, 2)
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (4, 'Entertainment Centre', 'Natural Maple', 735, 3)
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (5, 'Writers Desk', 'Cherry', 540, 1)
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (6, '8-Drawer Desk', 'White Ash', 800, 2)
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (7, 'Dining Table', 'Natural Ash', 500, 2)
INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineId)
VALUES (8, 'Computer Desk', 'Walnut', 250, 3)
SELECT 1 FROM dual;

-- Order Line Table

INSERT ALL
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1001, 1, 2)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1001, 2, 3)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1001, 3, 4)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1002, 4, 5)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1003, 3, 1)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1004, 3, 2)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1005, 6, 3)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1006, 8, 4)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1006, 4, 5)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1006, 6, 1)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1007, 5, 2)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1007, 7, 3)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1008, 1, 4)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1008, 2, 5)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1009, 3, 12)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1009, 8, 1)
  INTO Order_Line (OrderID, ProductID, OrderedQuantity) VALUES (1010, 4, 3)
SELECT 1 FROM dual;


--*********** UPDATE AND LIST DATA 
-- In this section, write queries to update ot list data based on the project instruction. 
-- You write one UPDATE and three SELECT statements.

-- 1.

UPDATE product
SET productstandardprice = productstandardprice + 100
WHERE productid BETWEEN 2 AND 7 AND productid NOT IN (2, 7);


-- 2. 

SELECT ProductID, ProductDescription AS ProductName, ProductLineId AS ProductLine
FROM Product
WHERE ProductLineID NOT IN (1,3)
ORDER BY ProductLineId, ProductID;

-- 3.

SELECT *
FROM customer
WHERE customercity LIKE 'S%t%'
ORDER BY customerid;

-- 4.

SELECT ProductID, ProductStandardPrice, ProductStandardPrice * 1.1 AS ListPrice
FROM Product;

