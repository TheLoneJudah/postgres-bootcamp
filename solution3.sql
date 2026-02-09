--Q1: List all customers along with their total payment amount.
--Output: customer_id, full_name, total_amount
select 
c.customer_id,
c.first_name || ' ' || c.last_name as full_name,
sum(p.amount) as total_amount
from customer as c
inner join payment as p on p.customer_id = c.customer_id
group by c.customer_id
order by customer_id;

--Q2: Retrieve the top 10 customers by total amount spent.
--Output: full_name, email, total_amount
select 
c.first_name || ' ' || c.last_name as full_name,
c.email,
sum(p.amount) as total_amount
from customer as c
inner join payment as p on p.customer_id = c.customer_id
group by c.email, c.first_name, c.last_name
order by total_amount desc
limit 10;

--Q3: Display all films and their corresponding categories.
--Tables: film, film_category, category
select 
f.title as film_title,
c.name as category
from film as f
join film_category as fc on fc.film_id = f.film_id
join category as c on c.category_id = fc.category_id
order by f.title asc;

--Q4: Find the number of rentals made by each customer.
--Output: customer_id, full_name, total_rentals
select
c.customer_id,
c.first_name || ' ' || c.last_name as full_name,
count(r.customer_id) as total_rentals
from customer as c
join rental as r on c.customer_id= r.customer_id
group by c.customer_id, c.first_name, c.last_name
order by count(r.customer_id) desc;

--Q5: List customers who have never made a payment.
--Hint: LEFT JOIN
select
c.customer_id,
c.first_name || ' ' || c.last_name as full_name,
sum(p.amount) as total_payments
from customer as c
left join payment as p on c.customer_id = p.customer_id
group by c.customer_id
having sum(p.amount) is null;

--Q6: Show total revenue generated per store.
--Tables: store, staff, payment
select 
st.store_id,
sum(p.amount) as total_revenue
from store as st
join staff as sf on sf.store_id = st.store_id
join payment as p on p.staff_id = sf.staff_id
group by st.store_id
order by total_revenue desc;

--Q7: Identify the top 5 most rented movies.
--Output: film_title, rental_count
select
f.title as film_title,
count(r.customer_id) as rental_count
from film as f
join inventory as i on i.film_id = f.film_id
join rental as r on r.inventory_id = i.inventory_id
group by f.title
order by rental_count desc;

--Q8 (BONUS): Find customers who rented more than 30 films.
--Output: full_name, rental_count
select
c.customer_id,
c.first_name || ' ' || c.last_name as full_name,
count(r.customer_id) as rental_count
from customer as c
join rental as r on r.customer_id = c.customer_id
group by c.customer_id
having count(r.customer_id) > 30
order by rental_count desc;











