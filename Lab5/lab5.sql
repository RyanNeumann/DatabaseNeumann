--Name: Ryan Neumann
--Date: February 25, 2016
--Topic: Lab 5

--1. Show the cities of agents booking an order for a customer whose id is 'c002'.
--   Use Joins; no subqueries
Select a.city
From agents a
Inner join orders o
On a.aid = o.aid
Where o.cid = 'c002';
--2. Show the ids of products ordered through any agent who makes at least one
--   order for a customer in Dallas, sorted by pid from highest to lowest.
--   Use joins; no subqueries.
Select o.pid
From orders o
Inner join customers c
On o.cid = c.cid
Where c.city in ('Dallas')
Order by pid desc;

--3. Show the names of customers who have never placed an order.  Use a
--   subquery
Select c.name
From customers c
Where c.cid not in (select o.cid
		    from orders o);


--4. Show the names of customers who have never placed an order.  Use an
--   outer join.
Select c.name
From customers c
Full outer join orders o
On c.cid = o.cid
Where o.cid is null;

--5. Show the names of customers who placed at least one order through
--   an agent in their own city, along with those agent(s') names. 
Select c.name, a.name
From customers c
Join orders o on c.cid = o.cid
Join agents a on a.aid = o.aid
Where c.city = a.city;

--6.  Show the name of customers and agents living in the same city, 
--    along with the name of the shared city, regardless of whether 
--    or not the customer has ever placed an order with that agent.

SELECT c.name, a.agents, c.city
FROM customers c, agents a
where c.city = a.city

--7.  Show the name and city of customers who live in the city that 
--    makes the feewest different kind of products.  (Hint: use count
--    and group by on the products table).

Select c.name, c.city
From customers c
Where c.city in (Select city
		From products
		Group by city
		Order by count (pid) asc
		Limit 1)