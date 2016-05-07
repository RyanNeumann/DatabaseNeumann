--1. Display the name and city of customers who live in any city that makes the most different kinds of
--products. (There are two cities that make the most different products. Return the name and city of
--customers from either one of those.)
select c.name, c.city
from customers c
where city in (select city
		from products
		group by city
		order by count(pid) Desc
		Limit 2);


--2. Display the names of products whose priceUSD is strictly above the average priceUSD, in reversealphabetical
--order.
select name
from products
where priceUSD > (Select avg(priceusd) from products)
order by name desc;


--3. Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low.
select c.name, o.pid, o.dollars
From orders o
Inner join customers c on c.cid = o.cid
order by o.dollars desc;



--4. Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use
--coalesce to avoid showing NULLs.
select c.name, COALESCE(o.dollars, 0) AS total
FROM customers c
Inner join orders o on c.cid = o.cid
order by c.name asc;




--5. Display the names of all customers who bought products from agents based in Tokyo along with the
--names of the products they ordered, and the names of the agents who sold it to them.
select c.name, p.name, a.name
from orders o
inner join products p on o.pid = p.pid
inner join customers c on o.cid = c.cid
inner join agents a on o.aid = a.aid
where a.city = 'Tokyo';


--6. Write a query to check the accuracy of the dollars column in the Orders table. This means calculating
--Orders.totalUSD from data in other tables and comparing those values to the values in Orders.totalUSD.
--Display all rows in Orders where Orders.totalUSD is incorrect, if any.
-- SEMICOLON!!!
Select *
From (Select o.*, o.qty*p.priceusd*(1-(discount/100)) as truedollars
      from orders o
      inner join products p on o.pid = p.pid
      inner join customers c on o.cid = c.cid) as tmptable
Where dollars != truedollars;



--7. What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example
--queries in SQL to demonstrate. (Feel free to use the CAP2 database to make your points here.)

-- The difference between left outer join and right outer join is which table is read first.  If you want all the rows in the right column to match any of the rows in the left column, you would use RIGHT OUTER JOIN, because it uses the right table first.  If you wanted to do the opposite, and select all the rows from the left table to match any of the rows in the right table, then you would use LEFT OUTER JOIN.  
-- 
-- An example of LEFT OUTER JOIN would be:
-- 	
-- 	select * from employee 
-- 	left outer join location 
-- 	where employee.empID = location.empID;
-- 		
-- The left outer join would grab all the rows from employee and match them up with any location that matched that row.  
-- 
-- An example of RIGHT OUTER JOIN would be:
-- 	SELECT column_name(s)
-- 	FROM table1
-- 	RIGHT OUTER JOIN table2
-- 	WHERE table1.column_name=table2.column_name;
-- 	
-- 	
-- The RIGHT OUTER JOIN would take the data from table 2 first, and compare that to the data of table 1.  
-- 
-- The main difference between the OUTER JOIN is the order in which the sql database handles the tables.  
