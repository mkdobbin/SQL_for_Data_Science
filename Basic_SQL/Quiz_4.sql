-- SQL for Data Science Quiz 4

-- Q1 Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
select CustomerID,
FirstName || ' ' || LastName as Name,
Address,
City || ' ' || Country
from Customers

-- Q2 Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
select EmployeeID,
FirstName,
LastName,
lower(substr(FirstName,1,4) || substr(LastName, 1, 2)) as NewID
from Employees

-- Q3 Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
Select EmployeeID,
FirstName,
LastName,
HireDate,
(STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate))
    - (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', HireDate))
    AS YearsWorked
from Employees
where YearsWorked >= 15
Order BY LastName DESC

-- Q4 Profiling the Customers table, answer the following question.
select *
from Customers
where FirstName IS NULL

-- Q5 Find the cities with the most customers and rank in descending order.
select City, Count(CustomerID) as NumberOfCustomers
from Customers
group by City
order by NumberOfCustomers DESC

-- Q6 Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
select i.invoiceID,
c.FirstName,
c.LastName,
c.FirstName || c.LastName || i.invoiceID as NewID
from Invoices i
left join Customers c ON c.CustomerID = i.CustomerID
where NewID like 'AstridGruber%'
