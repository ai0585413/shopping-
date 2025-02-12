CREATE TABLE Customer (
    Cus_ID INT,
    Cus_name VARCHAR(100),
    Street VARCHAR(100),
    City VARCHAR(100),
    Postalcode VARCHAR(20),
    Country_Code VARCHAR(10),
    Contact VARCHAR(20),
    PRIMARY KEY (Cus_ID)
);

DELETE FROM Customer WHERE Cus_ID = 1;


INSERT INTO Customer (Cus_ID, Cus_name, Street, City, Postalcode, Country_Code, Contact)
VALUES (1, 'John Doe', '123 Elm St', 'Springfield', '12345', 'US', '1234567890');

INSERT INTO Customer (Cus_ID, Cus_name, Street, City, Postalcode, Country_Code, Contact)
VALUES (2, 'Jane Smith', '456 Oak St', 'Metropolis', '67890', 'US', '2345678901');

INSERT INTO Customer (Cus_ID, Cus_name, Street, City, Postalcode, Country_Code, Contact)
VALUES (3, 'Alice Johnson', '789 Pine St', 'Gotham', '11223', 'US', '3456789012');

INSERT INTO Customer (Cus_ID, Cus_name, Street, City, Postalcode, Country_Code, Contact)
VALUES (4, 'Bob Brown', '101 Maple St', 'Smalltown', '33445', 'US', '4567890123');

INSERT INTO Customer (Cus_ID, Cus_name, Street, City, Postalcode, Country_Code, Contact)
VALUES (5, 'Charlie Davis', '202 Birch St', 'Riverside', '55667', 'US', '5678901234');



CREATE TABLE ProductCategory (
    Category_ID INT,
    Category_Name VARCHAR2(100),
    Category_Description CLOB,
    PRIMARY KEY (Category_ID)
);

INSERT INTO ProductCategory (Category_ID, Category_Name, Category_Description) 
VALUES (1, 'Food', 'Fresh and packaged food items.');

INSERT INTO ProductCategory (Category_ID, Category_Name, Category_Description) 
VALUES (2, 'Drinks', 'Beverages including soft drinks and juices.');

INSERT INTO ProductCategory (Category_ID, Category_Name, Category_Description) 
VALUES (3, 'Baby Products', 'Diapers, baby food, and toys.');

INSERT INTO ProductCategory (Category_ID, Category_Name, Category_Description) 
VALUES (4, 'Cosmetics', 'Skincare, makeup, and grooming products.');

INSERT INTO ProductCategory (Category_ID, Category_Name, Category_Description) 
VALUES (5, 'Clothes', 'Clothing for all ages and occasions.');


CREATE TABLE Product (
    Product_ID INT,
    Product_name VARCHAR2(100),
    Product_price DECIMAL(10, 2),
    Pro_description CLOB,
    Stock_update INT,
    Category_ID INT,
    PRIMARY KEY (Product_ID),
    FOREIGN KEY (Category_ID) REFERENCES ProductCategory(Category_ID)
);


INSERT INTO Product (Product_ID, Product_name, Product_price, Pro_description, Stock_update, Category_ID)
VALUES (1, 'Organic Apple', 1.49, 'Fresh organic apples', 1, 1); 

INSERT INTO Product (Product_ID, Product_name, Product_price, Pro_description, Stock_update, Category_ID)
VALUES (2, 'Orange Juice', 2.99, '100% pure orange juice', 1, 2); 

INSERT INTO Product (Product_ID, Product_name, Product_price, Pro_description, Stock_update, Category_ID)
VALUES (3, 'Diapers Pack', 9.99, 'Pack of disposable diapers', 2, 3); 

INSERT INTO Product (Product_ID, Product_name, Product_price, Pro_description, Stock_update, Category_ID)
VALUES (4, 'Face Cream', 15.00, 'Nourishing face cream', 1, 4); 

INSERT INTO Product (Product_ID, Product_name, Product_price, Pro_description, Stock_update, Category_ID)
VALUES (5, 'Men''s T-Shirt', 10.99, 'Cotton t-shirt for men', 1, 5); 

CREATE TABLE ProductOrder (
    Order_ID INT,
    Order_date DATE,
    Order_state VARCHAR(50),
    Tot_amount DECIMAL(10, 2),
    Cus_ID INT,
    PRIMARY KEY(Order_ID),
    FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID)
);

INSERT INTO ProductOrder (Order_ID, Order_date, Order_state, Tot_amount, Cus_ID)
VALUES (1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Shipped', 35.97, 1);

INSERT INTO ProductOrder (Order_ID, Order_date, Order_state, Tot_amount, Cus_ID)
VALUES (2, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 'Delivered', 22.50, 2);

INSERT INTO ProductOrder (Order_ID, Order_date, Order_state, Tot_amount, Cus_ID)
VALUES (3, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'Processing', 65.98, 3);

INSERT INTO ProductOrder (Order_ID, Order_date, Order_state, Tot_amount, Cus_ID)
VALUES (4, TO_DATE('2024-09-04', 'YYYY-MM-DD'), 'Shipped', 85.48, 4);

INSERT INTO ProductOrder (Order_ID, Order_date, Order_state, Tot_amount, Cus_ID)
VALUES (5, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Delivered', 10.99, 5);


CREATE TABLE Payment (
    Pay_ID INT,
    Pay_amount DECIMAL(10, 2),
    Pay_date DATE,
    Pay_method VARCHAR(50),
    
    Order_ID INT,
    PRIMARY KEY(Pay_ID),
    FOREIGN KEY (Order_ID) REFERENCES ProductOrder(Order_ID)
);


INSERT INTO Payment (Pay_ID, Pay_amount, Pay_date, Pay_method, Order_ID)
VALUES (1, 35.97, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Credit Card', 1);

INSERT INTO Payment (Pay_ID, Pay_amount, Pay_date, Pay_method, Order_ID)
VALUES (2, 22.50, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 'PayPal', 2); 

INSERT INTO Payment (Pay_ID, Pay_amount, Pay_date, Pay_method, Order_ID)
VALUES (3, 65.98, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'Credit Card', 3); 

INSERT INTO Payment (Pay_ID, Pay_amount, Pay_date, Pay_method, Order_ID)
VALUES (4, 85.48, TO_DATE('2024-09-04', 'YYYY-MM-DD'), 'Debit Card', 4); 

INSERT INTO Payment (Pay_ID, Pay_amount, Pay_date, Pay_method, Order_ID)
VALUES (5, 10.99, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Credit Card', 5);

CREATE TABLE Shipment (
    Ship_ID INT,
    Shipment_date DATE,
    Shipment_status VARCHAR(50),
    Order_ID INT,
    PRIMARY KEY(Ship_ID),
    FOREIGN KEY (Order_ID) REFERENCES ProductOrder(Order_ID)
);

INSERT INTO Shipment (Ship_ID, Shipment_date, Shipment_status, Order_ID)
VALUES (1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Shipped', 1);

INSERT INTO Shipment (Ship_ID, Shipment_date, Shipment_status, Order_ID)
VALUES (2, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 'Delivered', 2); 

INSERT INTO Shipment (Ship_ID, Shipment_date, Shipment_status, Order_ID)
VALUES (3, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'Processing', 3);

INSERT INTO Shipment (Ship_ID, Shipment_date, Shipment_status, Order_ID)
VALUES (4, TO_DATE('2024-09-04', 'YYYY-MM-DD'), 'Shipped', 4);

INSERT INTO Shipment (Ship_ID, Shipment_date, Shipment_status, Order_ID)
VALUES (5, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Delivered', 5);


CREATE TABLE Shopping_Cart (
    Cart_ID INT,
    Cart_date DATE,
    Cus_ID INT,
    Category_ID INT,
    PRIMARY KEY(Cart_ID),
    FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID),
    FOREIGN KEY (Category_ID) REFERENCES ProductCategory(Category_ID)
);


INSERT INTO Shopping_Cart (Cart_ID, Cart_date, Cus_ID, Category_ID)
VALUES (1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 1, 1); 

INSERT INTO Shopping_Cart (Cart_ID, Cart_date, Cus_ID, Category_ID)
VALUES (2, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 2, 2); 

INSERT INTO Shopping_Cart (Cart_ID, Cart_date, Cus_ID, Category_ID)
VALUES (3, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 3, 3); 

INSERT INTO Shopping_Cart (Cart_ID, Cart_date, Cus_ID, Category_ID)
VALUES (4, TO_DATE('2024-09-04', 'YYYY-MM-DD'), 4, 4); 

INSERT INTO Shopping_Cart (Cart_ID, Cart_date, Cus_ID, Category_ID)
VALUES (5, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 5, 5); 


CREATE TABLE Review (
    Review_ID INT,
    Rating INT,
    Text CLOB,
    Product_ID INT,
    Cus_ID INT,
    PRIMARY KEY (Review_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID)
);

INSERT INTO Review (Review_ID, Rating, Text, Product_ID, Cus_ID)
VALUES (1, 5, 'Great product!', 1, 1);  

INSERT INTO Review (Review_ID, Rating, Text, Product_ID, Cus_ID)
VALUES (2, 4, 'Very refreshing juice.', 2, 2); 

INSERT INTO Review (Review_ID, Rating, Text, Product_ID, Cus_ID)
VALUES (3, 4, 'Good quality diapers.', 3, 3); 

INSERT INTO Review (Review_ID, Rating, Text, Product_ID, Cus_ID)
VALUES (4, 5, 'Effective face cream.', 4, 4);

INSERT INTO Review (Review_ID, Rating, Text, Product_ID, Cus_ID)
VALUES (5, 4, 'Comfortable t-shirt.', 5, 5); 


-- Discount Table
CREATE TABLE Discount (
    Discount_ID INT,
    Dis_type VARCHAR(50),
    Dis_value DECIMAL(5, 2),
    Product_ID INT,
    PRIMARY KEY(Discount_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Discount (Discount_ID, Dis_type, Dis_value, Product_ID)
VALUES (1, '10% Off', 10.00, 1);


INSERT INTO Discount (Discount_ID, Dis_type, Dis_value, Product_ID)
VALUES (2, '20% Off', 20.00, 2);


INSERT INTO Discount (Discount_ID, Dis_type, Dis_value, Product_ID)
VALUES (3, '5% Off', 5.00, 3);


INSERT INTO Discount (Discount_ID, Dis_type, Dis_value, Product_ID)
VALUES (4, '15% Off', 15.00, 4);


INSERT INTO Discount (Discount_ID, Dis_type, Dis_value, Product_ID)
VALUES (5, '25% Off', 25.00, 5);


CREATE TABLE New_Customer (
    Cus_ID INT,
    Discount_ID INT,
    PRIMARY KEY(Cus_ID),
    FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID),
    FOREIGN KEY (Discount_ID) REFERENCES Discount(Discount_ID)
);


INSERT INTO New_Customer (Cus_ID, Discount_ID)
VALUES (1, 1);


INSERT INTO New_Customer (Cus_ID, Discount_ID)
VALUES (2, 2);





CREATE TABLE Repeat_Customer (
    Cus_ID INT,
    Discount_ID INT,
    PRIMARY KEY(Cus_ID),
    FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID),
    FOREIGN KEY (Discount_ID) REFERENCES Discount(Discount_ID)
);




INSERT INTO Repeat_Customer (Cus_ID, Discount_ID)
VALUES (3, 3);

INSERT INTO Repeat_Customer (Cus_ID, Discount_ID)
VALUES (4, 4);

INSERT INTO Repeat_Customer (Cus_ID, Discount_ID)
VALUES (5, 5);



CREATE TABLE ProductOrder_Details (
    Order_detailsID INT,
    Order_quantity INT,
    Order_unitprice DECIMAL(10, 2),
    Product_ID INT,
    Order_ID INT,
    Discount_ID INT,
    PRIMARY KEY( Order_detailsID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES ProductOrder(Order_ID),
    FOREIGN KEY (Discount_ID) REFERENCES Discount(Discount_ID)
);

INSERT INTO ProductOrder_Details (Order_detailsID, Order_quantity, Order_unitprice, Product_ID, Order_ID, Discount_ID)
VALUES (1, 2, 1.49, 1, 1, NULL);

INSERT INTO ProductOrder_Details (Order_detailsID, Order_quantity, Order_unitprice, Product_ID, Order_ID, Discount_ID)
VALUES (2, 1, 2.99, 2, 1, NULL); 

INSERT INTO ProductOrder_Details (Order_detailsID, Order_quantity, Order_unitprice, Product_ID, Order_ID, Discount_ID)
VALUES (3, 1, 9.99, 3, 3, NULL); 

INSERT INTO ProductOrder_Details (Order_detailsID, Order_quantity, Order_unitprice, Product_ID, Order_ID, Discount_ID)
VALUES (4, 1, 15.00, 4, 4, 1); 

INSERT INTO ProductOrder_Details (Order_detailsID, Order_quantity, Order_unitprice, Product_ID, Order_ID, Discount_ID)
VALUES (5, 1, 10.99, 5, 5, NULL); 



--query 1 How can we calculate the total sales for each product category?
create view as TOT_SALES_EACH_PRODUCT
SELECT PC.Category_Name, SUM(D.Order_quantity * D.Order_unitprice) AS Total_Sales
FROM ProductCategory PC
JOIN Product Pr ON PC.Category_ID = Pr.Category_ID
JOIN ProductOrder_Details D ON Pr.Product_ID = D.Product_ID
GROUP BY PC.Category_Name;

--2 Which products have been shipped or processed?

create view as PRODUCT_SHIPPED_OR_PROCESSED
SELECT DISTINCT Pr.Product_name
FROM Product Pr
JOIN ProductOrder_Details D ON Pr.Product_ID = D.Product_ID
JOIN ProductOrder P ON D.Order_ID = P.Order_ID
JOIN Shipment S ON P.Order_ID = S.Order_ID
WHERE S.Shipment_status = 'Delivered' OR S.Shipment_status='Shipped';

--3 What are the discounted prices for products available for new and repeat customers?
create view as DIS_INFO
SELECT P.Product_name, P.Product_price, D.Dis_value, 
       (P.Product_price - (P.Product_price * D.Dis_value / 100)) AS Discounted_Price
FROM Product P
JOIN Discount D ON P.Product_ID = D.Product_ID
WHERE D.Discount_ID IN (
    SELECT Discount_ID FROM New_Customer
    UNION
    SELECT Discount_ID FROM Repeat_Customer
)
ORDER BY Discounted_Price DESC;



--4 What is the average rating for each product?
create view as RATING_OF_EACH_PRODUCT
SELECT Pr.Product_name, AVG(R.Rating) AS Avg_Rating
FROM Product Pr
JOIN Review R ON Pr.Product_ID = R.Product_ID
GROUP BY Pr.Product_name;


--5 How many orders does each customer place per month?
create view as NUM_OF_ORDER_PER_MONTH
SELECT c.Cus_name, TO_CHAR(po.Order_date, 'YYYY-MM') AS month, COUNT(po.Order_ID) AS order_count
FROM ProductOrder po
JOIN Customer c ON po.Cus_ID = c.Cus_ID
GROUP BY c.Cus_name, TO_CHAR(po.Order_date, 'YYYY-MM')
ORDER BY month DESC, order_count DESC;




--6 What are the highest-selling products in each region?
create view as HIGHEST_SELLING_PO_EACH_REGION
SELECT 
    c.City AS Region,
    p.Product_name,
    SUM(pod.Order_quantity) AS Total_quantity,
    RANK() OVER (PARTITION BY c.City ORDER BY SUM(pod.Order_quantity) DESC) AS Product_Rank
FROM 
    Customer c
JOIN 
    ProductOrder po ON c.Cus_ID = po.Cus_ID
JOIN 
    ProductOrder_Details pod ON po.Order_ID = pod.Order_ID
JOIN 
    Product p ON pod.Product_ID = p.Product_ID
GROUP BY 
    c.City, p.Product_name
ORDER BY 
    c.City, Product_Rank;



--GRAPH How many customers use Debit and Credit cards for payments, and how many total payments were made using these methods?
-- Query to count customers who use Debit and Credit cards with respective counts
SELECT 
    p.Pay_method, 
    COUNT(DISTINCT c.Cus_ID) AS Customer_Count,  
    COUNT(p.Pay_ID) AS Total_Payments          
FROM 
    Payment p
JOIN 
    ProductOrder po ON p.Order_ID = po.Order_ID
JOIN 
    Customer c ON po.Cus_ID = c.Cus_ID
WHERE 
    p.Pay_method IN ('Debit Card', 'Credit Card') 
GROUP BY 
    p.Pay_method;  


--7
--7 What is the detailed information of each shopping cart, including customer details, products, prices, and reviews?

create view SHOPPING_CART_DETAIL_INFO as
SELECT 
    sc.Cart_ID,
    sc.Cart_date,
    c.Cus_name AS Customer_Name,
    c.Contact AS Customer_Contact,
    pc.Category_Name AS Category,
    p.Product_name AS Product_Name,
    p.Product_price AS Product_Price,
    o.Order_state AS Order_Status,
    r.Rating AS Product_Rating,
    r.Text AS Review_Text
FROM 
    Shopping_Cart sc
JOIN 
    Customer c ON sc.Cus_ID = c.Cus_ID
LEFT JOIN 
    ProductCategory pc ON sc.Category_ID = pc.Category_ID
LEFT JOIN 
    Product p ON pc.Category_ID = p.Category_ID
LEFT JOIN 
    ProductOrder o ON o.Cus_ID = c.Cus_ID
LEFT JOIN 
    Review r ON r.Cus_ID = c.Cus_ID AND r.Product_ID = p.Product_ID
ORDER BY 
    sc.Cart_date DESC;
