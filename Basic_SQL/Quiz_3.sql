-- Q1) Using a subquery, find the names of all the tracks for the album "Californication".
select Name
from tracks
where AlbumId =
    (select AlbumId
    from albums
    where Title = "Californication"
    )

-- Q2) Find the total number of invoices for each customer along with the customer's full name, city and email.
select c.CustomerId,
c.FirstName,
c.LastName,
c.city,
c.Email,
COUNT(i.InvoiceId) as InvoiceCount
from customers c
LEFT JOIN invoices i ON C.CustomerId = i.CustomerId
group by i.CustomerId

-- Q3) Retrieve the track name, album, artistID, and trackID for all the albums.
select t.name as TrackName,
t.trackId,
al.AlbumID,
al.Title as AlbumName,
ar.artistID
from tracks t
Left Join albums al on t.AlbumID = al.AlbumID
Left Join artists ar on ar.artistID = al.artistID
where TrackID = 12

-- Q4) Question 4 Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
select m.LastName as Manager,
e.LastName as Employee
from Employees e
Inner Join Employees m on e.ReportsTo = m.EmployeeID

-- Q5) Find the name and ID of the artists who do not have albums.
select ar.ArtistID,
ar.Name
from Artists ar
where ar.ArtistID not in
    (select Albums.ArtistID
    from Albums)

-- Q6) Question 6 Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
select E.FirstName, E.LastName
from Employees E
UNION
select C.FirstName, C.LastName
from Customers C
Order by C.LastName DESC

--Q7) Question 7 See if there are any customers who have a different city listed in their billing city versus their customer city.
select c.CustomerID, c.City, i.BillingCity
from Customers c
Left Join Invoices i on c.CustomerID = i.CustomerID
where c.City != i.BillingCity
