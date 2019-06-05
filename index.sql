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
  











