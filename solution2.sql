--1. Retrieve all unique customer first names from the customer table.
select distinct first_name, *
from customer
order by first_name asc;

--2. Find the top 5 customers who have spent the most money.
select customer_id, count(payment_id) as number_of_payments, sum(amount) as total_amount_spent
from payment
group by customer_id
order by total_amount_spent desc
limit 5;

--3. List all films with a rental rate greater than 4.00.
select *
from film
where rental_rate > 4.00
order by rental_rate asc;

--4. Count the number of payments per customer and display only customers with more than 15 payments.
select customer_id, count(payment_id) as number_of_payments
from payment
group by customer_id
having count(payment_id) > 15
order by number_of_payments asc;

--5. Retrieve the first 10 films alphabetically using FETCH.
select *
from film
order by title asc
fetch first 10 row only;

--6. Find the total amount paid per staff member.
select staff_id, sum(amount) as amount_per_staff
from payment
group by staff_id
order by staff_id;

--7. List customers whose email ends with .org.
select distinct customer_id, first_name, last_name, email
from customer 
where email like '%.org'
order by customer_id;

--8. Using DISTINCT ON, retrieve the latest payment record per customer.
select distinct on (customer_id)
customer_id, payment_id, amount, payment_date, staff_id
from payment
order by customer_id, payment_date desc;

--9. Display the average payment amount per customer, ordered from highest to lowest.
select customer_id, avg(amount) as average_amount
from payment
group by customer_id
order by average_amount desc;

--10. Retrieve all payments made between $2.99 and $5.99.
select *
from payment
where amount between 2.99 and 5.99
order by amount asc;

--Bonus Challenge: Identify the top 3 cities with the highest number of customers.
select 
city.city, 
count(customer.customer_id) as number_of_customers
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
group by city.city
order by number_of_customers desc
LIMIT 3;






