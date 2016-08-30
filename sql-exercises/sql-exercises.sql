--| 1. Write a query to return all category names with their descriptions from the Categories table.
select [CategoryName], [Description]
from [Categories]

--| 2. Write a query to return the contact name, customer id, company name and city name of all Customers in London. 
select [ContactName], [CustomerID], [CompanyName], [City]
from [Customers]
where City = 'London'

--| 3. Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
select * 
from Suppliers 
where ContactTitle 
	IN ('Marketing Manager', 'Sales Representative') 
	AND Fax IS NOT NULL;

--| 4. Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
select [CustomerID]
from Orders
where [OrderDate] between '01/01/1997' and '12/31/1997' and freight < 100

--| 5. Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
select [CompanyName], [ContactName]
from [Customers]
where [Country] = 'Mexico' 
OR [Country] = 'Sweden' 
OR [Country] = 'Germany'

--| 6. Write a query to return a count of the number of discontinued products in the Products table.
select count(*) 
from [Products] 
where [Discontinued] = 1;


--| 7. Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
select [CategoryName], [Description]
from [Categories]
where [CategoryName] LIKE 'Co%'

--| 8. Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
select [CompanyName], City, Country, PostalCode
from Suppliers
where [Address] LIKE '%rue%'
order by [CompanyName] asc

--| 9. Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.
select sum([Quantity]) as 'Quantity Purchased'
from [Order Details]
group by [Quantity], [ProductID]
order by 'Quantity Purchased' desc

--| 10. Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.
select c.CompanyName,c.Address,c.City,c.PostalCode,c.Country,o.OrderDate 
from Orders o, Shippers s, Customers c 
where o.ShipVia = s.ShipperID AND s.CompanyName = 'Speedy Express';

--| 11. Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.
select [CompanyName], [ContactName], [ContactTitle], [Region]
from [Suppliers]

--| 12. Write a query to return all product names from the Products table that are condiments.
select ProductName 
from Products 
	left outer join Categories on Products.CategoryID = Categories.CategoryID
where CategoryName = 'Condiments';

--| 13. Write a query to return a list of customer names who have no orders in the Orders table.
select ContactName
from Customers
	left outer join Orders on Customers.CustomerID = Orders.CustomerID
where OrderID is null;

--| 14. Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
insert into Shippers (CompanyName,Phone)
values ('Amazon', null);

--| 15. Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
update Shippers
set CompanyName = 'Amazon Prime Shipping'
where CompanyName = 'Amazon';

--| 16. Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select 
	Shippers.CompanyName, 
	round(sum(Orders.Freight),0) as 'FreightTotals'
from Shippers
	left outer join Orders 
	on Orders.ShipVia = Shippers.ShipperID
	where Orders.Freight is not null
group by Shippers.CompanyName
order by FreightTotals desc;

--| 17. Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
select 
	LastName + ', ' + FirstName as DisplayName
from Employees

--| 18. Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
insert into Customers (CustomerID, CompanyName, ContactName)
	values('RYDOW', 'Cracker Factory', 'Ryan Wilson');

insert into Orders (CustomerID)
	values('RW');

insert into [Order Details](OrderID, ProductID, UnitPrice)
	(select OrderID, ProductID, UnitPrice
	from Orders
		left outer join Products
		on ProductName = 'Grandma''s Boysenberry Spread'
		where CustomerID = 'RW');


--| 19. Write a query to remove yourself and your order from the database.
delete from [Order Details]
where OrderID = 
	(select OrderID
	from Orders
	where CustomerID = 'RW');

delete from Orders
where CustomerID = 'RW'

delete from Customers
where CustomerID = 'RW'

--| 20. Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
select ProductName, sum(UnitsInStock)
from Products
group by ProductName
having sum(UnitsInStock) > 100