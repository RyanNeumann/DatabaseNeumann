-- 1. Get the cities of agents booking an order for a customer whose cid is ‘c002’.

Select city 
from agents 
where aid in (select aid
	      from orders 
	      where cid = 'c002');

--2.Get the ids of products ordered through any agent who takes at least one order from a customer in
--Dallas, sorted by pid from highest to lowest. (This is not the same as asking for ids of products ordered
--by customers in Dallas.)
select  distinct pid 
from orders 
where aid in (select aid 
             from orders 
             where cid in ( select cid 
			   from customers 
			   where city = 'Dallas'))
			   order by pid Desc;	


--3.Get the ids and names of customers who did not place an order through agent a01.
select cid, name
from customers
where cid in (select cid
	      from orders
	      where aid != 'a01');

--4.Get the ids of customers who ordered both product p01 and p07.
select cid
from orders 
where pid  = 'p01' INTERSECT	(Select cid
	                       from orders 
	                       where pid = 'p07');
 
--5.Get the ids of products not ordered by any customers who placed any order through agent a07 in pid
Select distinct pid 
from orders 
where cid not in (select cid
                  from orders 
                  where aid= 'a07')
--order from highest to lowest.
--6.Get the name, discounts, and city for all customers who place orders through agents in London or New
--York.
Select name, discount, city 
from customers 
where cid in  (Select cid
              from orders 
              where aid in (select aid 
                            from agents 
                            where city = 'London' or city = 'New York'));
--7.Get all customers who have the same discount as that of any customers in Dallas or London
Select name, discount  
from customers 
where discount = ( select Discount 
                  from customers 
                  where city = 'London' or city ='Dallas');