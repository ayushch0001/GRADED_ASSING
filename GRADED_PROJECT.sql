

CREATE DATABASE IF NOt EXISTS sql_glca_gradedProject;
USE sql_glca_gradedProject;
CREATE TABLE supplier
(
	SUPP_ID INT PRIMARY KEY AUTO_INCREMENT,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL
); 


INSERT INTO sql_glca_gradedProject.supplier
	VALUES(DEFAULT, 'Rajesh Retails', 'Delhi', '1234567890'),
		  (DEFAULT, 'Appario Ltd.', 'Mumbai', '2589631470'),
		  (DEFAULT, 'Knome products', 'Banglore', '9785462315'),
		  (DEFAULT, 'Bansal', 'Retails Kochi', '8975463285'),
		  (DEFAULT, 'Mittal Ltd.', 'Lucknow', '7898456532');


CREATE TABLE customer
(
	CUS_ID INT PRIMARY KEY AUTO_INCREMENT,
	CUS_NAME VARCHAR(20) NOT NULL,
	CUS_PHONE VARCHAR(10) NOT NULL,
	CUS_CITY VARCHAR(30) NOT NULL,
	CUS_GENDER CHAR
); 

INSERT INTO sql_glca_gradedProject.customer
	VALUES(DEFAULT, 'AAKASH', '9999999999', 'DELHI', 'M'),
		  (DEFAULT,'AMAN', '9785463215', 'NOIDA', 'M'),
		  (DEFAULT, 'NEHA', '9999999999', 'MUMBAI', 'F'),
		  (DEFAULT, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
		  (DEFAULT, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

CREATE TABLE category
(
	CAT_ID INT PRIMARY KEY AUTO_INCREMENT,
	CAT_NAME VARCHAR(20) NOT NULL	
);


INSERT INTO sql_glca_gradedProject.category
	VALUES(DEFAULT, 'BOOKS'),
		  (DEFAULT, 'GAMES'),
		  (DEFAULT, 'GROCERIES'),
		  (DEFAULT, 'ELECTRONICS'),
		  (DEFAULT,  'CLOTHES');
          
CREATE TABLE sql_glca_gradedProject.product
	(
		PRO_ID INT PRIMARY KEY AUTO_INCREMENT,
		PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
		PRO_DESC VARCHAR(60),
		CAT_ID INT,
        FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
     ); 

INSERT INTO sql_glca_gradedProject.product(PRO_NAME,PRO_DESC,CAT_ID)  
	VALUES('GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
		  ('TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
          ('ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
          ('OATS', 'Highly Nutritious from Nestle', 3),
          ('HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
          ('MILK', '1L Toned MIlk', 3),
          ('Boat Earphones', '1.5Meter long Dolby Atmos', 4),
          ('Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
          ('Project IGI', 'compatible with windows 7 and above', 2),
          ('Hoodie', 'Black GUCCI for 13 yrs and above', 5),
          ('Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
          ('Train Your Brain', 'By Shireen Stephen', 1);
          
CREATE TABLE sql_glca_gradedProject.supplier_pricing
(
	PRICING_ID INT PRIMARY KEY AUTO_INCREMENT,
	PRO_ID INT,
    FOREIGN KEY (PRO_ID) REFERENCES  product(PRO_ID),
	SUPP_ID INT, 
    FOREIGN KEY (SUPP_ID) REFERENCES  supplier(SUPP_ID),
	SUPP_PRICE INT DEFAULT 0
);

INSERT INTO sql_glca_gradedProject.supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE)
	VALUES(1, 2, 1500),
		  (1, 5, 30000),
          (5, 1, 3000),
          (2, 3, 2500),
          (4, 1, 1000),
          (12, 2, 780),
          (12, 4, 789),
          (3, 1, 31000),
          (1, 5, 1450),
          (4, 2, 999),
          (7, 3, 549),
          (7, 4, 529),
          (6, 2, 105),
          (6, 1, 99),
          (2, 5, 2999),
          (5, 2, 2999);   
          
CREATE TABLE   sql_glca_gradedProject.order 
(
	ORD_ID INT PRIMARY KEY AUTO_INCREMENT,
	ORD_AMOUNT INT NOT NULL,
	ORD_DATE DATE NOT NULL,
	CUS_ID INT, 
    FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID),
	PRICING_ID INT,
    FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);   
    
INSERT INTO `order`
	VALUES(101, 1500, '2021-10-06', 2, 1),
          (102, 1000, '2021-10-12', 3, 5),
		  (103, 30000,'2021-09-16', 5, 2),
          (104, 1500, '2021-10-05', 1, 1),
          (105, 3000, '2021-08-16', 4, 3),
          (106, 1450, '2021-08-18', 1, 9),
          (107, 789,'2021-09-01', 3, 7),
          (108, 780, '2021-09-07', 5, 6),
          (109, 3000, '2021-01-10', 5, 3),
          (110, 2500, '2021-09-10', 2, 4),
          (111, 1000, '2021-09-15', 4, 5),
          (112, 789, '2021-09-16', 4, 7),
          (113, 31000, '2021-09-16', 1, 8),
          (114, 1000, '2021-09-16', 3, 5),
          (115, 3000, '2021-09-16', 5, 3),
          (116, 99, '2021-09-17', 2, 14);
                 
CREATE TABLE rating
(
	RAT_ID INT PRIMARY KEY AUTO_INCREMENT, 
    ORD_ID INT,
    FOREIGN KEY(ORD_ID) REFERENCES `order`(ORD_ID),    
	RAT_RATSTARS INT NOT NULL
); 	

INSERT INTO rating(ORD_ID, RAT_RATSTARS)
	VALUES(101, 4),
		  (102, 3),
          (103, 1),
          (104, 2),
          (105, 4),
          (106, 3),
          (107, 4),
          (108, 4),
          (109, 3),
          (110, 5),
          (111, 3),
          (112, 4),
          (113, 2),
          (114, 1),
          (115, 1),
          (116, 0);
          
          
SELECT CUS_GENDER ,COUNT(CUS_ID)FROM customer WHERE CUS_ID IN
	(SELECT DISTINCT CUS_ID FROM `order` WHERE ORD_AMOUNT >=3000) 
GROUP BY CUS_GENDER;  

select 
	ORD_ID,
	ORD_AMOUNT,
	ORD_DATE,
	CUS_ID,
    PRO_NAME
    From `order` o
    JOIN supplier_pricing s
    ON o.PRICING_ID = s. PRICING_ID 
    join product p
    on p.pro_id = s.pro_id
    where  cus_id =2;
	

-- 7 
select 
	P.PRO_ID,
    P.PRO_NAME
    From product p 
    JOIN supplier_pricing s
	on p.pro_id = s.pro_id
    join `ORDER` O
     ON o.PRICING_ID = s. PRICING_ID 
    where  ORD_DATE > '2021-10-05';

-- 5 
SELECT COUNT(SP.PRO_ID) AS SUPPLY_NO,
S.SUPP_ID,
S.SUPP_NAME,
S.SUPP_NAME,
S.SUPP_CITY,
S.SUPP_PHONE 
FROM  SUPPLIER S 
JOIN SUPPLIER_PRICING SP
ON SP.SUPP_ID = S.SUPP_ID
GROUP BY SP.SUPP_ID
HAVING SUPPLY_NO>=2;


-- 6
CREATE VIEW LOWEST_EXPENSIVE_PRODUCT AS
SELECT
C.CAT_ID,
C.CAT_NAME,
P.PRO_NAME,
MIN(SP.SUPP_PRICE) AS MIN_PRICE_OF_PRODUCT
FROM SUPPLIER_PRICING SP
JOIN PRODUCT P
ON SP.PRO_ID = P.PRO_ID
JOIN CATEGORY C
ON P.CAT_ID = C.CAT_ID
GROUP BY SP.PRO_ID;


-- 8 
SELECT CUS_NAME , CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR '%A' ;


-- 9 

 DELIMITER $$
CREATE PROCEDURE `get_supplier_ratings`()
 BEGIN
	SELECT
	S.SUPP_ID,
	S.SUPP_NAME,
    AVG(R.RAT_RATSTARS) AS RATING,
    CASE
      WHEN AVG(R.RAT_RATSTARS) >= 5 THEN 'EXCELENT SERVICE'
      WHEN AVG(R.RAT_RATSTARS) > 4 THEN 'GOOD SERVICE'
      WHEN AVG(R.RAT_RATSTARS) > 2 THEN 'AVERAGE SERVICE'
      ELSE 'POOR SERVICE'
    END AS TYPE_OF_SERVICE
	FROM SUPPLIER S  
    JOIN SUPPLIER_PRICING SP  ON S.SUPP_ID = SP.SUPP_ID
    JOIN `order` O ON   SP.PRICING_ID = O.PRICING_ID 
    JOIN RATING R ON O.ORD_ID = R.ORD_ID 
	GROUP BY S.SUPP_ID;
END ;


