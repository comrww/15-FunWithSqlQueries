-- 1. Write a query to return all category names with their descriptions from the Categories table.
select [CategoryName], [Description]
from [Categories]

-- 2. Write a query to return the contact name, customer id, company name and city name of all Customers in London. 
select [ContactName], [CustomerID], [CompanyName], [City]
from [Customers]
where City = 'London'

-- 3. Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
select *
from [Suppliers]
where Fax IS NOT null 

-- 4. Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
select [CustomerID]
from Orders
where [OrderDate] between '01/01/1997' and '12/31/1997' and freight < 100

-- 5. Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
select [CompanyName], [ContactName]
from [Customers]
where [Country] = 'Mexico' 
OR [Country] = 'Sweeden' 
OR [Country] = 'Germany'

-- 6. Write a query to return a count of the number of discontinued products in the Products table.
select count([Discontinued])
from [Products]

-- 7. Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
select [CategoryName], [Description]
from [Categories]
where [CategoryName] LIKE 'Co%'

-- 8. Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
select [CompanyName], City, Country, PostalCode
from Suppliers
where [Address] LIKE '%rue%'
ORDER BY [CompanyName] ASC

-- 9. Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.
select sum([Quantity]) as 'Quantity Purchased'
from [Order Details]
GROUP BY [Quantity], [ProductID]
ORDER BY 'Quantity Purchased' desc

-- 10. Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.
????
-- 11. Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.
select [CompanyName], [ContactName], [ContactTitle], [Region]
from [Suppliers]

-- 12. Write a query to return all product names from the Products table that are condiments.
select [ProductName]
from [Products]
where [CategoryID] = 'Condiment'

-- 13. Write a query to return a list of customer names who have no orders in the Orders table.
????

-- 14. Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
select [ShipName]
from [Orders]
ALTER COLUMN ShipName 'Amazon'

-- 15. Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
select [CompanyName]
from [Shippers]
Alter Column CompanyName 'Amazon Prime Shipping'

-- 16. Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select CompanyName, round(Freight, 0)
from Shippers, Orders

-- 17. Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
select FirstName + LastName AS 'DisplayName'
from Employees
order by LastName, FirstName

-- 18. Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
select ContactName
from Customers
add row CompanyName = ['Grandma's Boysenberry Spread'], ContactName = [Ryan Wilson]

-- 19. Write a query to remove yourself and your order from the database.
select ContactName
from Customers
remove row CompanyName = ['Grandma's Boysenberry Spread'], ContactName = [Ryan Wilson]

-- 20. Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
select ProductName
from Products 
where UnitsInStock > 100