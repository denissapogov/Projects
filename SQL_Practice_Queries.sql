CREATE TABLE CUSTOMER
( CUST_ID CHAR (3) PRIMARY KEY, 
FIRST_NAME CHAR (20) NOT NULL, 
LAST_NAME CHAR (20) NOT NULL, 
ADDRESS CHAR (20),
CITY CHAR (15),
STATE CHAR (2),
POSTAL CHAR (5),
EMAIL CHAR (25),
BALANCE DECIMAL (7, 2),
CREDIT_LIMIT DECIMAL (7, 2),
REP_ID CHAR (2));



INSERT INTO CUSTOMER
VALUES ('125', 'Joey', 'Smith', '17 Fourth St',
  'Cody', 'WY', '82414', 'jsmith17@example.com',
  80.68, 500.00, '05');

INSERT INTO CUSTOMER
VALUES ('182', 'Billy', 'Rufton', '21 Simple Cir',
  'Garland', 'WY', '82435', 'billyruff@example.com',
  43.13, 750.00, '10');

INSERT INTO CUSTOMER
VALUES ('227', 'Sandra', 'Pincher', '53 Verde Ln',
  'Powell', 'WY', '82440', 'spinch2@example.com',
  156.38, 500.00, '15');

INSERT INTO CUSTOMER
VALUES ('294', 'Samantha', 'Smith', '14 Rock Ln',
  'Ralston', 'WY', '82440', 'ssmith5@example.com',
  58.60, 500.00, '10');

INSERT INTO CUSTOMER
VALUES ('314', 'Tom', 'Rascal', '1 Rascal Farm Rd',
  'Cody', 'WY', '82414', 'trascal3@example.com',
  17.25, 250.00, '15');

INSERT INTO CUSTOMER
VALUES ('375', 'Melanie', 'Jackson', '42 Blackwater Way',
  'Elk Butte', 'WY', '82433',
  'mjackson5@example.com', 252.25, 250.00, '05');
  
INSERT INTO CUSTOMER
VALUES ('435', 'James', 'Gonzalez', '16 Rockway Rd',
   'Wapiti', 'WY', '82450', 'jgonzo@example.com',
   230.40, 1000.00, '15');

INSERT INTO CUSTOMER
VALUES ('492', 'Elmer', 'Jackson', '22 Jackson Farm Rd',
   'Garland', 'WY', '82435',
   'ejackson4@example.com', 45.20, 500.00, '10');

INSERT INTO CUSTOMER
VALUES ('543', 'Angie', 'Hendricks', '27 Locklear Ln',
   'Powell', 'WY', '82440',
   'ahendricks7@example.com', 315.00, 750.00, '05');

INSERT INTO CUSTOMER
VALUES ('616', 'Sally', 'Cruz', '199 18th Ave',
   'Ralston', 'WY', '82440', 'scruz5@example.com',
   8.33, 500.00, '15');

INSERT INTO CUSTOMER
VALUES ('721', 'Leslie', 'Smith', '123 Sheepland Rd',
   'Elk Butte', 'WY', '82433',
   'lsmith12@example.com', 166.65, 1000.00, '10');

INSERT INTO CUSTOMER
VALUES ('795', 'Randy', 'Blacksmith', '75 Stream Rd',
   'Cody', 'WY', '82414',
   'rblacksmith6@example.com', 61.50, 500.00, '05');

select * from customer

CREATE TABLE INVOICES
(
INVOICE_NUM CHAR(5) PRIMARY KEY, 
INVOICE_DATE DATE,
CUST_ID CHAR(3)); 

INSERT INTO INVOICES
VALUES ('14216', '2021-11-15', '125');

INSERT INTO INVOICES
VALUES ('14219', '2021-11-15', '227');

INSERT INTO INVOICES
VALUES ('14222', '2021-11-16', '294');

INSERT INTO INVOICES
VALUES ('14224', '2021-11-16', '182');

INSERT INTO INVOICES
VALUES ('14228', '2021-11-18', '435');

INSERT INTO INVOICES
VALUES ('14231', '2021-11-18', '125');

INSERT INTO INVOICES
VALUES ('14233', '2021-11-18', '435');

INSERT INTO INVOICES
VALUES ('14237', '2021-11-19', '616');

CREATE TABLE ITEM
(
ITEM_ID CHAR (4) PRIMARY KEY, DESCRIPTION CHAR (30), ON_HAND DECIMAL (4, 0), CATEGORY CHAR (3),
LOCATION CHAR (1),
PRICE DECIMAL (6, 2));

INSERT INTO ITEM
VALUES ('AD72', 'Dog Feeding Station',
    12, 'DOG', 'B', 79.99);

INSERT INTO ITEM
VALUES ('BC33', 'Feathers Bird Cage (12x24x18)',
     10, 'BRD', 'B', 79.99);

INSERT INTO ITEM
VALUES ('CA75', 'Enclosed Cat Litter Station',
     15, 'CAT', 'C', 39.99);

INSERT INTO ITEM
VALUES ('DT12', 'Dog Toy Gift Set', 27,
     'DOG', 'B', 39.99);

INSERT INTO ITEM
VALUES ('FM23', 'Fly Mask with Ears', 41,
     'HOR', 'C', 24.95);

INSERT INTO ITEM
VALUES ('FS39', 'Folding Saddle Stand', 12,
     'HOR', 'C', 39.99);

INSERT INTO ITEM
VALUES ('FS42', 'Aquarium (55 Gallon)',
     5, 'FSH', 'A', 124.99);

INSERT INTO ITEM
VALUES ('KH81', 'Wild Bird Food (25 lb)',
    24, 'BRD', 'C', 19.99);
    
INSERT INTO ITEM
VALUES ('LD14', 'Locking Small Dog Door', 14,
     'DOG', 'A', 49.99);

INSERT INTO ITEM
VALUES ('LP73', 'Large Pet Carrier', 23,
    'DOG', 'B', 59.99);

INSERT INTO ITEM
VALUES ('PF19', 'Pump & Filter Kit', 5,
     'FSH', 'A', 74.99);

INSERT INTO ITEM
VALUES ('QB92', 'Quilted Stable Blanket',
     32, 'HOR', 'C', 119.99);

INSERT INTO ITEM
VALUES ('SP91', 'Small Pet Carrier',
     18, 'CAT', 'B', 39.99);

INSERT INTO ITEM
VALUES ('UF39', 'Underground Fence System',
     7, 'DOG', 'A', 199.99);

INSERT INTO ITEM
VALUES ('WB49', 'Insulated Water Bucket',
    34, 'HOR', 'C', 79.99);
    
CREATE TABLE INVOICE_LINE
( 
INVOICE_NUM CHAR(5), 
ITEM_ID CHAR(4),
QUANTITY DECIMAL(3,0), 
QUOTED_PRICE DECIMAL(6,2),
PRIMARY KEY (INVOICE_NUM, ITEM_ID));

INSERT INTO INVOICE_LINE
VALUES ('14216', 'CA75', 3, 37.99);

INSERT INTO INVOICE_LINE
VALUES ('14219', 'AD72', 2, 79.99);

INSERT INTO INVOICE_LINE
VALUES ('14219', 'DT12', 4, 39.99);

INSERT INTO INVOICE_LINE
VALUES ('14222', 'LD14', 1, 47.99);

INSERT INTO INVOICE_LINE
VALUES ('14224', 'KH81', 4, 18.99);

INSERT INTO INVOICE_LINE
VALUES ('14228', 'FS42', 1, 124.99);

INSERT INTO INVOICE_LINE
VALUES ('14228', 'PF19', 1, 74.99);

INSERT INTO INVOICE_LINE
VALUES ('14231', 'UF39', 2, 189.99);

INSERT INTO INVOICE_LINE
VALUES ('14233', 'KH81', 1, 19.99);

INSERT INTO INVOICE_LINE
VALUES ('14233', 'QB92', 4, 109.95);

INSERT INTO INVOICE_LINE
VALUES ('14233', 'WB49', 4, 74.95);

INSERT INTO INVOICE_LINE
VALUES ('14237', 'LP73', 3, 54.95);

describe invoice_line

CREATE TABLE SALES_REP
( REP_ID CHAR (2) PRIMARY KEY, 
FIRST_NAME CHAR (20) NOT NULL, 
LAST_NAME CHAR (20) NOT NULL, 
ADDRESS CHAR (20),
CITY CHAR (15),
STATE CHAR (2),
POSTAL CHAR (5),
CELL_PHONE CHAR (12),
COMMISSION DECIMAL (7, 2),
RATE DECIMAL (3, 2));

INSERT INTO SALES_REP
VALUES ('05', 'Susan', 'Garcia', '42 Mountain Ln', 'Cody', 'WY',
 '82414', '307-824-1245', 12743.16, 0.04);
 
 INSERT INTO SALES_REP
VALUES ('10', 'Richard', 'Miller', '87 Pikes Dr', 'Ralston', 'WY',
 '82440', '307-406-4321', 20872.11, 0.06);

INSERT INTO SALES_REP
VALUES ('15', 'Donna', 'Smith', '312 Oak Rd', 'Powell', 'WY',
 '82440', '307-982-8401', 14912.92, 0.04);

INSERT INTO SALES_REP
VALUES ('20', 'Daniel', 'Jackson', '19 Lookout Dr', 'Elk Butte',
 'WY', '82433', '307-833-9481', 0.00, 0.04);

INSERT INTO SALES_REP (REP_ID, FIRST_NAME, LAST_NAME)
VALUES ('25', 'Donna', 'Sanchez');

select * from sales_rep;
select * from customer

select distinct customer.rep_id
from customer, sales_rep
where (customer.rep_id = sales_rep.rep_id)

SELECT CUST_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, SALES_REP.REP_ID, SALES_REP.FIRST_NAME, SALES_REP.LAST_NAME
FROM CUSTOMER, SALES_REP
WHERE (CUSTOMER.REP_ID = SALES_REP.REP_ID);

 # List the ID, first name, and last name of each customer whose credit limit is $500, together with the ID, first name, and last name of the sales rep who represents the customer.
 
 select customer.cust_id, customer.first_name, customer.last_name, sales_rep.rep_id, sales_rep.first_name, sales_rep.last_name
 from customer, sales_rep
 where credit_limit = 500 and (customer.rep_id = sales_rep.rep_id)
 
 # For every item on an invoice, list the invoice number, item ID, description, quantity ordered, quoted price, and unit price.

select * from invoice_line;
select * from item;
select * from invoices

select invoice_num, invoice_line.item_id, description, quantity, quoted_price, price
from item, invoice_line
where item.item_id = invoice_line.item_id

# Find the description of each item included in invoice number 14233.

select description
from item, invoice_line
where (item.item_id = invoice_line.item_id) and (invoice_num = 14233)

# Find the invoice number and invoice date for each invoice that includes an item stored in location C

SELECT DISTINCT INVOICES.INVOICE_NUM, INVOICE_DATE 
FROM INVOICE_LINE, INVOICES, ITEM
WHERE (INVOICE_LINE.INVOICE_NUM = INVOICES.INVOICE_NUM) AND (INVOICE_LINE.ITEM_ID = ITEM.ITEM_ID) AND (LOCATION	= ‘C’)

#List the customer ID, invoice number, invoice date, and invoice total for each invoice with a total that exceeds $250. 
#Assign the column name INVOICE_TOTAL to the column that displays invoice totals. 
#Order the results by invoice number.

select * from invoice_line;
select * from item;
select * from invoices;
select * from customer;

select cust_id, invoice_line.invoice_num, invoice_date, SUM(quantity * quoted_price) as Invoice_Totals
from invoices, invoice_line
where (invoice_line.invoice_num = invoices.invoice_num)
group by invoice_line.invoice_num
having Invoice_Totals > 250
order by invoice_num

#List the ID, first name, and last name for each sales rep together with the ID, first name, and last name for each customer the sales rep represents.

select * from customer;
select * from sales_rep;

select cust_id, c.first_name, c.last_name, r.rep_id, r.first_name, r.last_name
from customer c, sales_rep r 
where c.rep_id = r.rep_id

#For each item on an invoice, list the item ID, quantity ordered, invoice number, invoice date, customer ID, customer first name, and customer last name, 
#along with the last name of the sales rep who represents each customer.

select * from invoice_line;
select * from item;
select * from invoices;
select * from customer;
select * from sales_rep;

select item_id, invoice_line.quantity, invoice_line.invoice_num, invoices.invoice_date, customer.cust_id, customer.first_name, customer.last_name, sales_rep.last_name
from invoice_line, invoices, customer, sales_rep
WHERE (INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM) AND
      (CUSTOMER.CUST_ID = INVOICES.CUST_ID) AND
      (SALES_REP.REP_ID = CUSTOMER.REP_ID)
      
select * from customer;
select * from invoices;

insert into customer
values (999, "Den", "Sap", "14837 alcorine", "Tampa", "FL", "33513", "sapp@mail.ru", 150.00, 300.00, 15)

delete from customer
where cust_id = "999"


 #Display the ID, first name, and last name for each customer, along with the invoice number, and invoice date for all invoices. 
 #Include all customers in the results. For customers that do not have invoices, omit the invoice number and invoice date.

select c.cust_id, c.first_name, c.last_name, invoice_num, invoice_date
from customer c
LEFT join invoices i
on (c.cust_id = i.cust_id)

describe customer


CREATE VIEW DOGS AS
(SELECT ITEM_ID, DESCRIPTION, ON_HAND, PRICE
FROM ITEM
WHERE (CATEGORY = 'DOG')
);

select * from dogs
where price > 50

select * from customer

select cust_id, concat (first_name, " ", last_name) as Full_Name
from customer

select cust_id, first_name, || ' ' || last_name as Full_Name
from customer


DELIMITER //
CREATE PROCEDURE GET_CUSTOMER_NAME (IN I_CUST_ID CHAR(3)) BEGIN
DECLARE V_FULL_NAME VARCHAR(41);
SELECT CONCAT (FIRST_NAME, '' , LAST_NAME) INTO V_FULL_NAME
FROM CUSTOMER
WHERE CUST_ID = I_CUST_ID;
SELECT V_FULL_NAME; END //
DELIMITER ;

CALL GET_CUSTOMER_NAME(125)


select * from invoice_line;
select * from item;
select * from invoices;
select * from customer;
select * from sales_rep;


WITH t1 as (
select cust_id, credit_limit
from t2
where balance > 100),

t2 as (select cust_id, first_name, last_name, balance, credit_limit
from customer)

select * from t1

with t1 as (select cust_id, first_name, last_name, balance, credit_limit
from customer),

t2 as (select cust_id, credit_limit
from t1
where balance > 100)

select * from t2

----------------------------------------

with t1 as (
select cust_id, first_name, last_name, city, balance
from customer),

t2 as (select cust_id, city
from t1
where balance > 100)

select distinct city
from t2

select * from customer

select rep_id, postal
from customer
where cust_id IN (
	select cust_id
	from customer)


select * from customer

#Display the customers who have a balance greater than 100.

with balance_greater_100 as (
select cust_id, first_name, last_name
from customer
where balance > 100)

select * 
from balance_greater_100

#Count the number of customers in each city.

with t1 as (select city, count(*)
from customer
group by city)

select * from t1

#Show the total credit limit for each representative (REP_ID).

with t1 as (
select rep_id, sum(credit_limit)
from customer
group by rep_id)

select * 
from t1

#Identify customers with a balance greater than the average balance.


WITH AvgBalance AS (
    SELECT AVG(balance) as average_balance
    FROM customers
)
SELECT first_name, last_name, balance
FROM customers
WHERE balance > (SELECT average_balance FROM AvgBalance);

#OR WE CAN USE

select cust_id
from customer 
where balance >
	(select AVG(balance)
	from customer)

#List the customers with the highest credit limit in each city.

select * from customer

with t1 as (
select cust_id, city, credit_limit
from customer),

t2 as (
select distinct city, cust_id, MAX(credit_limit)
from customer
group by city, cust_id)

select * from t2

#Show the total balance for customers in each state, ordered by total balance descending.

with t1 as (
select cust_id, SUM(balance)
from customer
group by cust_id),

t2 as (select * from t1)
select * from t2

#Find the customers who have a balance greater than the average balance of all customers.

select * from customer
where balance > (select AVG(balance) from customer)


-- Find customers who have a balance greater than the average balance of all customers.

select cust_id 
from customer
where balance > (select AVG(balance) from customer)


select * from invoice_line;
select * from item;
select * from invoices;
select * from customer;
select * from sales_rep;

-- SUBQUERY
select first_name, last_name
from customer
where cust_id IN (
					select cust_id
					from customer
					where credit_limit = 500)
                    
# Find the total quantity of items sold in each invoice.

with t1 as (select invoice_num, SUM(quantity)
from invoice_line
group by invoice_num)

select * from t1

-- List the items that have a price higher than the average price of their category.

SELECT *
FROM item
WHERE price > (SELECT AVG(price) FROM item WHERE category = item.category)


-- Identify invoices with a total amount greater than the average total amount of all invoices.

select invoice_num, SUM(quoted_price)
from invoice_line
group by invoice_num
having SUM(quoted_price) > (
							select AVG(quoted_price)
							from invoice_line)

-- Display the customers who have made the highest number of purchases.

select * from invoice_line;
select * from item;
select * from invoices;
select * from customer;
select * from sales_rep;

select cust_id, count(*) as Purchase_count
from invoices
group by cust_id
order by Purchase_count desc

-- List the items that have never been part of an invoice.

select item_id
from item
where item_id NOT IN (select item_id from invoice_line group by item_id)

#OR 

SELECT *
FROM item
WHERE item_id NOT IN (SELECT DISTINCT item_id FROM invoice_line);


-- Find the sales representatives with a commission rate higher than the average rate.

select * from sales_rep where commission > (select AVG(commission) from sales_rep)

-- List items that are currently out of stock (ON_HAND = 0).

select * 
from item
where on_hand = 0

-- Display invoices where the customer's credit limit is exceeded.

select invoice_num 
from invoices
where cust_id IN (select cust_id from customer where balance > credit_limit group by cust_id)

-- Show invoices where the quoted price of each item is higher than the average quoted price.

select *
from invoice_line
where quoted_price > (select AVG(quoted_price) from invoice_line)

-- List sales representatives who have not made any sales (total commission = 0).

select * 
from sales_rep
where rate = 0

-- List invoices where the total quantity of items is greater than the average quantity.

select *
from invoice_line
where quantity > (select AVG(quantity) from invoice_line)

-- Show items that have been ordered in more than one invoice.

select item_id, count(invoice_num) as Count_Invoices
from invoice_line
group by item_id
having Count_Invoices > 1

-- LEFT JOIN

select invoice_date, invoices.cust_id, quantity, quoted_price
from invoice_line
LEFT JOIN invoices ON (invoice_line.invoice_num = invoices.invoice_num)

-- RIGHT JOIN

select cust_id, email, balance, sales_rep.first_name, sales_rep.last_name
from customer
RIGHT JOIN sales_rep on (customer.rep_id = sales_rep.rep_id)

-- LEFT JOIN

select cust_id, email, balance, sales_rep.first_name, sales_rep.last_name
from customer
LEFT JOIN sales_rep on (customer.rep_id = sales_rep.rep_id)


-- #STORED PROCEDURE MYSQL

DELIMITER //

CREATE PROCEDURE test()
BEGIN
    SELECT * FROM sales_rep;
END //

DELIMITER ;

-- Now, you can execute the stored procedure
CALL test();



delimiter //

create procedure new()
begin
select * from item;
end //

call new()



delimiter //

create procedure denis()
begin
select * from invoice_line;
end //

call denis()