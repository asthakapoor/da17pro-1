select * from sales 

select * from customers 

select * from products



--- 1st VIEW

CREATE VIEW customer_summary AS
SELECT c.cust_id, c.customer_name, COUNT(s.order_id) AS total_orders,
SUM(s.sales) AS total_spent
FROM customer as c  
INNER JOIN Sales as s ON c.cust_id = s.cust_id
GROUP BY c.cust_id, c.customer_name;

select * from customer_summary



----2nd VIEW

create view product_data as
SELECT p.category, sum(s.sales) as sales_sum, count(s.sales) sales_count, avg(s.sales) as sales_avg, 
sum(s.qty) as qty_sum, avg(s.discount) as discount_avg from sales as s
inner join products as p
on s.product_id=p.product_id
where category ='Furniture'
group by p.category
having count(s.sales)>2000
order by category desc

select * from product_data

select c.city,p.sub_category, SUM(s.sales) as sales_sum, sum(s.profit) as profit_sum, 
sum(s.qty) as qty_sum, sum(s.discount) as disc_sum from customer as c
left join sales as s
on c.cust_id=s.cust_id
left join product as p
on s.product_id=p.product_id
group by  c.city,p.sub_category
having SUM(s.sales) between 800 and 1300
order by SUM(s.sales);


---3rd VIEW

SELECT cust.cust_id,cust.customer_name,
SUM(sales.sales * sales.qty) AS total_sales,
AVG(sales.discount) AS avg_discount,
COUNT(sales.order_id) AS total_orders
FROM 
customer AS cust
JOIN 
sales AS sales
ON 
cust.cust_id = sales.cust_id
WHERE 
cust.age >= 40
GROUP BY 
cust.cust_id, cust.customer_name
HAVING 
SUM(sales.profit) > 1000
ORDER BY total_sales asc

create view cust_id_name_of_revenue as SELECT cust.cust_id,cust.customer_name,
SUM(sales.sales * sales.qty) AS total_sales,
AVG(sales.discount) AS avg_discount,
COUNT(sales.order_id) AS total_orders
FROM 
customer AS cust
JOIN 
sales AS sales
ON 
cust.cust_id = sales.cust_id
WHERE 
cust.age >= 40
GROUP BY 
cust.cust_id, cust.customer_name
HAVING 
SUM(sales.profit) > 1000
ORDER BY total_sales asc


---4th VIEW


CREATE TABLE StudyLabs (
LabID SERIAL PRIMARY KEY,
LabName VARCHAR(100),
SupervisorID INT 
);

CREATE VIEW LabsTotalStudentView AS
SELECT 
StudyLabs.LabName, 
COUNT(Student.StudentID) AS TotalStudent
FROM 
StudyLabs
LEFT JOIN 
Student ON StudyLabs.LabID = Student.LabID
GROUP BY 
StudyLabs.LabName
ORDER BY 
TotalStudent DESC;

select * from LabsTotalStudentView

