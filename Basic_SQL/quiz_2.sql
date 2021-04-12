--Q1 Find all the tracks that have a length of 5,000,000 milliseconds or more.
select TrackId
from Tracks
where Milliseconds > 5000000

--Q2 Find all the invoices whose total is between $5 and $15 dollars.
select InvoiceId, Total
from Invoices
where Total between 5 and 15

--Q3 Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
select FirstName, LastName, Company, State
from Customers
where State in ('RJ', 'DF', 'AB','BC','CA','WA','NY')

--Q4 Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
select CustomerID, InvoiceID, InvoiceDate Total
from Invoices
where CustomerID in (56, 58)
and Total between 1 and 5

--Q5 Find all the tracks whose name starts with 'All'.
select name
from tracks
where Name like 'All%'

--Q6 Find all the customer emails that start with "J" and are from gmail.com.
select CustomerID, Email
from Customers
where Email like ('J%gmail.com')

--Q7 Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
select Total, BillingCity
from Invoices
where BillingCity in ('Brasília', 'Edmonton', 'Vancouver')
order by Total DESC

--Q8 Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
select CustomerID, COUNT(InvoiceID) as NumberOfOrders
from Invoices
group by CustomerID


--Q9 Find the albums with 12 or more tracks.
select AlbumId, COUNT(TrackID) as NumberofTracks
from Tracks
group by AlbumId
Having NumberofTracks > 11
