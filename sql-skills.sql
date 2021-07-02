
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

-- Extra Credit
-- SQL

-- Artist Table

--     Select 10 artists in reverse alphabetical order.
SELECT * FROM artist
ORDER BY name DESC
LIMIT 10;
--     Select all artists that start with the word ‘Black’.
SELECT * FROM artist
WHERE name LIKE 'Black%'; 
--     Select all artists that contain the word ‘Black’.
SELECT * FROM artist
WHERE name LIKE '%Black%'; 
-- Employee Table

--     Find the birthdate for the youngest employee.
SELECT MAX(birth_date) FROM employee;
--     Find the birthdate for the oldest employee.
SELECT MIN(birth_date) FROM employee;
-- Invoice Table

--     Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*)FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ');
--     Get the average total of the orders.
SELECT AVG(total)FROM invoice;
-- More Join Queries

--     Get all playlist_track track_ids where the playlist name is Music.
SELECT track_id FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id;
--     Get all track names for playlist_id 5.
SELECT t.name FROM playlist_track pt
JOIN track t ON pt.track_id = t.track_id
WHERE playlist_id = 5;
--     Get all track names and the playlist name that they’re on ( 2 joins ).
SELECT t.name FROM playlist_track pt
JOIN track t ON pt.track_id = t.track_id
JOIN playlist p ON p.playlist_id = pt.playlist_id;
--     Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT track.name, title
FROM track
JOIN album ON album.album_id = track.album_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Alternative & Punk';
