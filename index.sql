--PRACTICE JOINS
--#1
-- SELECT * FROM invoice i
-- JOIN invoice_line il ON i.invoice_id = il.invoice_id
-- WHERE il.unit_price > .99;
--#2
-- SELECT i.invoice_date, c.first_name, c.last_name, i.total FROM customer c
-- JOIN invoice i ON c.customer_id = i.invoice_id
--#3
-- SELECT c.first_name, c.last_name, e.first_name, e.last_name FROM customer c
-- JOIN employee e ON c.support_rep_id = e.employee_id;
--#4
-- SELECT al.title, ar.name FROM album al
-- JOIN artist ar ON al.artist_id = ar.artist_id;
--#5
-- SELECT pt.track_id, p.name FROM playlist_track pt
-- JOIN playlist p ON pt.playlist_id = p.playlist_id;
--#6
-- SELECT tr.name, pt.playlist_id FROM track tr
-- JOIN playlist_track pt ON tr.track_id = pt.track_id
-- WHERE pt.playlist_id = 5;
--#7
-- SELECT tr.name, p.name FROM track tr
-- JOIN playlist_track pt ON tr.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id;
--#8
-- SELECT t.name, a.title
-- FROM track t
-- JOIN album a ON t.album_id = a.album_id
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Alternative & Punk';

--PRACTICE NESTED QUERIES
--#1
-- SELECT * FROM invoice
-- WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);
--#2
-- SELECT * FROM playlist_track
-- WHERE playlist_id IN ( SELECT playlist_id FROM playlist WHERE name = 'Music' );
--#3
-- SELECT name FROM track
-- WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);
--#4
-- SELECT * FROM track
-- WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');
--#5
-- SELECT * FROM track
-- WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');
--#6
-- SELECT * FROM track
-- WHERE album_id IN (
--   SELECT album_id FROM album WHERE artist_id IN (
--     SELECT artist_id FROM artist WHERE name = 'Queen'
--   )
-- );
  
--PRACTICE UPDATING ROWS
--#1
-- UPDATE customer
-- SET fax = NULL
-- WHERE fax IS NOT NULL;
--#2
-- UPDATE customer
-- SET company = 'Self'
-- WHERE company IS NULL;
--#3
-- UPDATE customer
-- SET last_name = 'Thompson'
-- WHERE customer_id = 28;
--#4
-- UPDATE customer
-- SET support_rep_id = 4
-- WHERE email = 'luisrojas@yahoo.cl';
--#5
-- UPDATE track
-- SET composer = 'The darkness around us'
-- WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal') 
-- AND composer IS NULL;

--GROUP BY
--#1
-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- GROUP BY g.name;
--#2
-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Pop' OR g.name = 'Rock'
-- GROUP BY g.name;
--#3
-- SELECT COUNT(*), artist.name
-- FROM album
-- JOIN artist ON artist.artist_id = album.artist_id
-- GROUP BY artist.name;

--USE DISTINCT
--#1
-- SELECT DISTINCT composer FROM track;
--#2
-- SELECT DISTINCT billing_postal_code FROM invoice;
--#3
-- SELECT DISTINCT company FROM customer;

--DELETE ROWS
-- CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
--#1
-- DELETE FROM practice_delete
-- WHERE type = 'bronze';
--#2
-- DELETE FROM practice_delete
-- WHERE type = 'silver';
---#3
-- DELETE FROM practice_delete 
-- WHERE value = 150;

-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(50),
--   email VARCHAR(50)
--   )
  
-- CREATE TABLE products (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(50),
--   price NUMERIC
--   )

-- CREATE TABLE orders (
--   id INT PRIMARY KEY REFERENCES products(id),
--   name VARCHAR(50),
--   price NUMERIC
-- )

-- INSERT INTO users (name, email)
-- VALUES ('Joe', 'adf@gmail.com'), ('Megan', 'asfrg2@aol.com'), ('Mahk', 'chevysux@toyota.com')

-- INSERT INTO products (name, price)
-- VALUES ('Pens', 234.23), ('Staples', 23), ('Gloves', 19.23)

-- INSERT INTO orders (id, name, price)
-- VALUES (1, 'Pens', 234.23), (2, 'Staples', 23), (3, 'Gloves', 1923)

-- SELECT * FROM orders
-- WHERE id = 1

-- SELECT * FROM orders

-- SELECT SUM(price) FROM orders
-- WHERE id = 1

-- ALTER TABLE orders
-- ADD FOREIGN KEY (id) REFERENCES users (id);

-- ALTER TABLE orders
-- ADD FOREIGN KEY (id) REFERENCES users (id);

-- ALTER TABLE users
-- ADD FOREIGN KEY (id) REFERENCES orders (id);

-- SELECT * FROM users
-- JOIN orders ON users.id = orders.id

-- SELECT COUNT(*), users.name
-- FROM orders
-- JOIN users ON users.id = orders.id
-- GROUP BY users.name


