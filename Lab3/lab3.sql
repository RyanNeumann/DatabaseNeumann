-- List the ordno and dollars of all orders.
Select ordno, dollars
From orders;
-- List the name and city of agents named Smith.
Select name, city 
from agents
where name in ('Smith');
-- List the pid, name, and priceUSD of products with quantity more than 208,000.
Select pid, name, priceUSD
from products 
where quantity > 208000;
-- List the name and cities of customers in Dallas.
Select name, city
from customers
where city in ('Dallas');
-- List the names of agents not in New York and not in Tokyo
select name
from agents
where city not in ('New York', 'Tokyo');
-- List all data for products not in Dallas or Duluth that cost US$1 or more.
select *
from products
where city not in ('Dallas', 'Duluth') and priceusd >= 1;
-- List all data for orders in January or March
select *
from orders
where mon in ('jan', 'mar');
-- List all data for orders in February less than US$500.
select *
from orders
where mon in ('feb') and dollars < 500;
--List all orders from the customer whose cid is C005
select *
from orders
where cid = ('c005');
