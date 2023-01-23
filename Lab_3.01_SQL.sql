-- Lab | SQL - Lab 3.01
-- In this lab, you will be using the Sakila database of movie rentals. You have been using this database for a couple labs already, 
-- but if you need to get the data again, refer to the official installation link.

Use sakila;



-- Activity 1
-- 1.1. Drop column picture from staff.

select * from staff;

alter table staff
drop column picture;



-- 1.2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

-- get the info of Tammy Sanders

select * from customer
where last_name = 'SANDERS';

# customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update
# '75', '2', 'TAMMY', 'SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', '79', '1', '2006-02-14 22:04:36', '2006-02-15 04:57:20'

select * from staff;

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, username) 
VALUES
(3,'TAMMY','SANDERS','79','TAMMY.SANDERS@sakilacustomer.org', 1, 'Tammy');



-- 1.3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 

select * from rental; # rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update

# rental_id SERIAL
# rental_date: 2023-01-23 14:00:00
# inventory_id: film_id: 1 -->  inventory_id: 1
select * from inventory;
# customer_id: '130'
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# return_date: Null if its possible
# staff_id: 1
# last_update: Null

CREATE TABLE IF NOT EXISTS rental (
rental_id SERIAL); 


INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id) 
VALUES
('2023-01-23 14:00:00','1','130',1);

select * from rental; 

#row inserted:
# rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
#'16050', '2023-01-23 14:13:36', '1', '130', NULL, '1', '2023-01-23 14:13:36'


-- Activity 2
-- 2.1. Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.
-- 2.2. Define primary keys and foreign keys for the new database.

