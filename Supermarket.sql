select * from new_schema.supermarket_sales

-- Retrieve all the invoices where invoices total price greater than $100 and date after 5/1/2019

select invoice_id, total_price, date
from new_schema.supermarket_sales
where total_price > 100 and date > 5/1/2019


-- Find the total sales (including tax) for each branch.

select branch, SUM(total_price + 'tax_5%') as Final
from new_schema.supermarket_sales
group by branch
order by Final desc


-- List the top product lines with the highest gross income.

select product_line, SUM(gross_income) as Highest_Gross_Income
from new_schema.supermarket_sales
group by product_line
order by Highest_Gross_Income desc

-- Calculate the average rating for male and female customers separately.

select AVG(rating), gender
from new_schema.supermarket_sales
group by gender
order by AVG(rating)


-- Count the number of invoices for each product line.

select count(distinct invoice_id), product_line
from new_schema.supermarket_sales
group by product_line
order by count(distinct invoice_id) desc

-- Find the branch with the highest total sales.

select * from new_schema.supermarket_sales

select branch, SUM(total_price)
from new_schema.supermarket_sales
group by branch
order by SUM(total_price) desc

-- Calculate the total tax collected for each city.

select city, SUM(tax)
from new_schema.supermarket_sales
group by city
order by SUM(tax) desc

-- List the invoice IDs and the corresponding customer types for those who spent more than $200.

select invoice_id, customer_type, SUM(total_price) 
from new_schema.supermarket_sales
group by invoice_id, customer_type
having SUM(total_price) > 200
order by SUM(total_price) desc

-- Find the average unit price for each product line.

select AVG(unit_price), product_line
from new_schema.supermarket_sales
group by product_line
order by AVG(unit_price)

select * from new_schema.supermarket_sales


-- Calculate the total sales for each month in the dataset.
ALTER TABLE new_schema.supermarket_sales
ADD COLUMN month VARCHAR(20); 

SET SQL_SAFE_UPDATES = 0;

UPDATE new_schema.supermarket_sales
SET month = DATE_FORMAT(STR_TO_DATE(date, '%m/%d/%Y'), '%M');


select month, SUM(total_price * quantity) as Total
from new_schema.supermarket_sales
group by month
order by SUM(total_price* quantity) desc
 

-- Find the average rating for each product line.

select product_line, AVG(rating)
from new_schema.supermarket_sales
group by product_line
order by AVG(rating) desc

-- List the products with a quantity of 5 or more and a total price of at least $10.

select invoice_id, product_line, total_price
from new_schema.supermarket_sales
where quantity > 5 and total_price >= 10

-- Count the number of invoices made by members and non-members for each branch.

select count(invoice_id), customer_type
from new_schema.supermarket_sales
group by customer_type

-- Calculate the average unit price and quantity for invoices with a rating of 5.

select * from new_schema.supermarket_sales

select AVG(unit_price), AVG(quantity)
from new_schema.supermarket_sales
where rating > 5

-- List the customers who made a purchase using Cash and spent more than $100.

select invoice_id, payment, total_price
from new_schema.supermarket_sales
where payment = 'Cash' and total_price > 100


select SUM(total_price), payment
from new_schema.supermarket_sales
group by payment
order by SUM(total_price)

-- Calculate the total sales and gross income for invoices made using Ewallet.

select SUM(total_price), SUM(gross_income), payment
from new_schema.supermarket_sales
where payment = 'Ewallet'
group by payment

