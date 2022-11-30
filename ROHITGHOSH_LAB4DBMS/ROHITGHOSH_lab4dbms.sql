create database IF NOT EXISTS greatlearning_lab4dbms;
use greatlearning_lab4dbms;

-- 1 Create Required Tables

CREATE TABLE IF NOT EXISTS SUPPLIER(
	SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50),
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS CUSTOMER(
	CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
	CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30),
    CUS_GENDER char
);

CREATE TABLE IF NOT EXISTS CATEGORY(
	CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS PRODUCT(
	PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL default "Dummy",
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID)
);

CREATE TABLE IF NOT EXISTS SUPPLIER_PRICING (
	PRICING_ID INT PRIMARY KEY,
    PRO_ID INT, FOREIGN KEY (PRO_ID) REFERENCES PRODUCT(PRO_ID),
	SUPP_ID INT, FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID),
    SUPP_PRICE INT DEFAULT 0
);


CREATE TABLE IF NOT EXISTS ORDERS(
	ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT, FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
    PRICING_ID INT, FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS RATINGS (
	RAT_ID INT PRIMARY KEY,
	ORD_ID INT, FOREIGN KEY (ORD_ID) REFERENCES ORDERS(ORD_ID),
    RAT_RATSTARS INT NOT NULL
);

-- 2 INSERT DATA INTO GIVEN TABLES
INSERT INTO 
	SUPPLIER (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES 
	(1, "Rajesh Retails", "Delhi", "1234567890"),
	(2, "Appario Ltd", "Mumbai", "2589631470"),
	(3, "Knome products", "Banglore", "9785462315"),
	(4, "Bansal Retails", "Kochi" , "8975463285"),
	(5, "Mittal Ltd", "Lucknow", "7898456532");

INSERT INTO 
	CUSTOMER(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
VALUES 
	(1, "AAKASH", "9999999999", "DELHI", "M"),
	(2, "AMAN", "9785463215", "NOIDA", "M"),
	(3, "NEHA", "9999999999", "MUMBAI", "F"),
	(4, "MEGHA", "9994562399", "KOLKATA", "F"),
	(5,	"PULKIT", "7895999999", "LUCKNOW", "M");

INSERT INTO 
	CATEGORY(CAT_ID,CAT_NAME)
VALUES 
	(1, "BOOKS"),
	(2, "GAMES"),
	(3, "GROCERIES"),
	(4, "ELECTRONICS"),
	(5, "CLOTHES");
    
INSERT INTO 
	PRODUCT(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
VALUES 
	(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2),
	(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5),
	(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4),
	(4, "OATS", "Highly Nutritious from Nestle", 3),
	(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1),
	(6, "MILK", "1L Toned MIlk", 3),
	(7, "Boat Earphones", "1.5Meter long Dolby Atmos", 5),
	(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5),
	(9, "Project IGI", "compatible with windows 7 and above", 2),
	(10, "Hoodie", "Black GUCCI for 13 yrs and above", 5),
	(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1),
	(12, "Train Your Brain", "By Shireen Stephen", 1);
    
    
INSERT INTO 
	SUPPLIER_PRICING(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE)
VALUES 
	(1, 1, 2, 1500),
	(2, 3, 5, 30000),
	(3, 5, 1, 3000),
	(4, 2, 3, 2500),
	(5, 4, 1, 1000),
	(6, 12, 2, 780),
	(7, 12, 4, 789),
	(8, 3, 1, 31000),
	(9, 1, 5, 1450),
	(10, 4, 2, 999),
	(11, 7, 3, 549),
	(12, 7, 4, 529),
	(13, 6, 2, 105),
	(14, 6, 1, 99),
    (15, 5, 5, 2999),
	(16, 5, 2, 2999);
    
    
INSERT INTO ORDERS 
	(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)
VALUES 
	(101, 1500, "2021-10-06", 2, 1),
	(102, 1000, "2021-10-12", 3, 5),
	(103, 30000, "2021-09-16", 5, 2),
	(104, 1500, "2021-10-05", 1, 1),
	(105, 3000, "2021-08-16", 4, 3),
    (106, 1450, "2021-08-18", 1, 9),
    (107, 789, "2021-09-01", 3, 7),
    (108, 780, "2021-09-07", 5, 6),
    (109, 3000, "2021-00-10", 5, 3),
    (110, 2500, "2021-09-10", 2, 4),
    (111, 1000, "2021-09-15", 4, 5),
    (112, 789, "2021-09-16", 4, 7),
    (113, 31000, "2021-09-16", 1, 8),
    (114, 1000, "2021-09-16", 3, 5),
    (115, 3000, "2021-09-16", 5, 3),
    (116, 99, "2021-09-17", 2, 14);
    
    
INSERT INTO 
	RATINGS
VALUES 
	(1, 101, 4),
	(2,	102, 3),
	(3,	103, 1),
	(4,	104, 2),
	(5,	105, 4),
    (6,	106, 3),
    (7,	107, 4),
    (8,	108, 4),
    (9,	109, 3),
    (10, 110, 5),
    (11, 111, 3),
    (12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
    (16, 116, 0);
    
#3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
SELECT 
    customer.cus_gender AS Customer_Gender,
    COUNT(*) AS Total_Customers
FROM
    customer,
    orders
WHERE
    customer.cus_id = orders.cus_id
        AND ord_amount > 3000
GROUP BY customer.cus_gender;
#4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT 
    orders.cus_id as Orders_Customer_Id,
    product.pro_name AS Products,
        orders.ord_amount AS Order_Amount,
    orders.ord_date as Order_Date
FROM
    orders,
    product,
    supplier_pricing
WHERE
    orders.cus_id = 2
        AND orders.pricing_id = supplier_pricing.pricing_id
        AND supplier_pricing.pro_id = product.pro_id;
#5)	Display the Supplier details who can supply more than one product.

SELECT 
    supplier.supp_name AS Supplier_Name,
    supplier.supp_city AS Supplier_City,
    supplier.supp_phone AS Supplier_PhoneNumber
FROM
    supplier
WHERE
    1 < (SELECT 
            COUNT(*)
        FROM
            supplier,
            supplier_pricing
        WHERE
            supplier.supp_id = supplier_pricing.supp_id);
-- 6 Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select c.cat_id, c.cat_name,t1.pro_name,t1.supp_id,t1.supp_price
from 
	category c
inner join 
	(
		select 
			p.pro_id, p.pro_name, p.cat_id, s.pricing_id, s.supp_id, s.supp_price
		from 
			product p
		inner join 
			supplier_pricing s
		on 
			p.pro_id = s.pro_id
	) 
as
	t1
on
	c.cat_id = t1.cat_id
order by c.cat_id;

-- 7 Display the Id and Name of the Product ordered after “2021-10-05”.
select 
	p.pro_id, p.pro_name, t1.ord_date 
from 
	product p
inner join 
	(
		select 
			o.ord_id, o.ord_date, o.pricing_id, s.pro_id, s.supp_id
		from 
			orders o
		inner join
			supplier_pricing s
		on 
			o.pricing_id = s.pricing_id
	)
as
	t1
on
	p.pro_id = t1.pro_id
where
	ord_date > "2021-10-05";

-- 8 Display customer name and gender whose names start or end with character 'A'.

select cus_name from customer where cus_name like "A%" or cus_name like "%A";