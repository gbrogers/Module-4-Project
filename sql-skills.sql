
-- Artist Table

--     Add 3 new artists to the artist table using INSERT. (It’s already created.)
INSERT INTO artist (name)
VALUES ('Kurt Cobain'), ('Moby'), ('Spoon');
--     Select 5 artists in alphabetical order.
SELECT * FROM artist
LIMIT 5
-- Employee Table

--     List all employee first and last names only that live in Calgary.
SELECT * FROM employee 
WHERE city = 'Calgary'
--     Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee 
WHERE city = 'Calgary'
--     Count how many people live in Lethbridge.
SELECT Count(*) FROM employee
WHERE city = 'Lethbridge';
-- Invoice Table

--     Count how many orders were made from the USA.
SELECT Count(*) FROM invoice
WHERE billing_country = 'USA';
--     Find the largest order total amount.
SELECT MAX(total) FROM invoice;
--     Find the smallest order total amount.
SELECT MIN(total) FROM invoice;
--     Find all orders bigger than $5.
SELECT * FROM invoice
WHERE total > 5;
--     Count how many orders were smaller than $5.
SELECT * FROM invoice
WHERE total < 5;
--     Get the total sum of the orders.
SELECT SUM(total) FROM invoice;
-- JOIN Queries (Various tables)

--     Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT * 
FROM invoice i
JOIN invoice_line il on i.invoice_id = il.invoice_id
WHERE unit_price > 0.99;
--     Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT invoice_date, c.first_name, c.last_name, total 
FROM customer c
JOIN invoice i on c.customer_id = i.customer_id;
--     Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.
SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e on c.support_rep_id = e.employee_id;
--     Get the album title and the artist name from all albums.
SELECT title, name
FROM album
JOIN artist on artist.artist_id = album.artist_id;