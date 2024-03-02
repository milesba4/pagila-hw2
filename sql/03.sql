/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT(customer_id) FROM film JOIN inventory USING (film_id) JOIN rental USING (inventory_id) JOIN customer USING (customer_id)
WHERE film_id IN (SELECT film.film_id from payment JOIN rental using(rental_id) join inventory using(inventory_id) join film using(film_id) group by film.film_id 
ORDER BY SUM(payment.amount) desc limit 5) ORDER BY customer_id;
