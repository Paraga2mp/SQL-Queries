
#########################################################################################################                                                                                       #
# Name: Ashraf Mamun                                                                                    #                                                                                   #
#########################################################################################################

USE sakila;

# Query 1
# 1. Create a query that returns all film titles in alphabetical order for the language with ID = 1.

SELECT title AS "Film Title"
FROM film
WHERE language_id = 1
ORDER BY title;

# Query 2
# 2. Create a query that will list all the film titles containing the word “Drama” in the description.
# (You need only to accommodate the displayed spelling of the word.)

SELECT title AS "Film Title"
FROM film
WHERE description LIKE '%Drama%';

# Query 3
# 3. Create a query that lists all films with the ratings 'G', 'PG, and 'PG-13' and
# also do not have an original language ID. Build the query to check for all conditions, regardless of the data.
# Sort the results alphabetically by rating, then title.

SELECT title AS Film, rating AS Rating
FROM film
WHERE rating IN ('G', 'PG', 'PG-13') AND
      original_language_id is NULL
ORDER BY rating, title;

# Query 4
# 4. Create a query that lists all payment ids for amounts less than $2.99 and after the June 1st,
#  2005. Sort the results by payment date, then amount.

SELECT payment_id AS "Payment ID", payment_date AS "Payment Date"
FROM payment
WHERE amount <2.99 AND
      payment_date > '2005-06-01'
ORDER BY payment_date, amount;

# Query 5
# 5. Create a query that lists all cities who have 'Canada' as a country.  Build the query as if you do not
# know Canada's country id.  Hint: Remember you can have selects within select queries. Sort the results
# reverse alphabetically by city name.

SELECT city AS City
FROM city
WHERE country_id = (
    SELECT country_id
    FROM country
    WHERE country = 'Canada'
)
ORDER BY city DESC;


# Query 6
# 6. Create a query that returns all films that either start with the letter ‘A’, or end with the
# letter ‘t’. Suppress any duplicate film names and sort the results in reverse alphabetical order.

SELECT DISTINCT title AS "Film Title"
FROM film
WHERE title LIKE 'A%' OR  title LIKE '%t'
ORDER BY title DESC;

# Query 7
# 7. Create a query that returns each customer ID and the count of payments they have made.
# Make sure you call the second column "count". Sort results by count in reverse order

SELECT customer.customer_id AS "Customer ID", COUNT(payment_id) AS Count
FROM customer, payment
WHERE customer.customer_id = payment.customer_id
GROUP BY payment.customer_id
ORDER BY Count DESC;

# Query 8
# 8. Create a query that lists the CustomerId and maximum paid by each customer.  Then modify the
# query to display only those records whose amount was more than $5.99. Sort from highest total
# to lowest total, then sort by CustomerId from lowest to highest.

SELECT customer_id AS CustomerID, MAX(amount) AS "Max Amount"
FROM  payment
WHERE amount > 5.99
GROUP BY customer_id
ORDER BY MAX(amount) DESC, customer_id ASC;

# Query 9
# 9. Create a query that returns the CustomerId and the total number of items for each rental.
# Sort the results from the most number of items rented to least number of items rented.
# Note: this is using a different table from the previous two queries.

SELECT customer_id AS "Customer No", COUNT(rental_id) AS "No of Rental"
FROM rental
GROUP BY customer_id
ORDER BY COUNT(rental_id) DESC;


# Query 10
# 10. Create a query that returns all customers who have payments with a total over $7.00 and were served by the staff
# with an ID of 1. Sort the results by customer ID from highest to lowest, then amount lowest to highest.

SELECT customer_id AS Customer, amount AS Amount
FROM payment
WHERE amount > 7.0 AND
      staff_id = 1
ORDER BY customer_id DESC, amount ASC;


# Query 11
# 11. Create a query that lists the CategoryId and count of films (name this column Cat_Count). Restrict your results
#  to only those categories with more than 60 films. Sort the results by the Category Count in descending order.

SELECT category_id AS "Categoty ID", COUNT(film_id) AS Cat_Count
FROM film_category
GROUP BY  category_id
HAVING COUNT(film_id) > 60
ORDER BY COUNT(film_id) DESC;

# Query 12
# Create a query that returns the names of the films with Actor ID 107.  Sort the movie titles alphabetically.

SELECT title AS "Film Title"
FROM film, film_actor
WHERE film.film_id = film_actor.film_id AND
      actor_id = 107
ORDER BY title;  # By default it sorts ascending order


# Query 13
# Create a query that only lists the actor ids from actors that appear in more than 36 films. Sort from largest to
# smallest amount of films per actor. Rename columns as indicated.

SELECT actor.actor_id AS "Actor ID", COUNT(film_actor.film_id) AS Film_Count
FROM actor, film_actor
WHERE actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
HAVING COUNT(film_actor.film_id) > 36
ORDER BY COUNT(film_actor.film_id) DESC;

# Query 14
# Create a query that displays the total of films are not in inventory. Call the single column "Total Not In Inventory".

SELECT  COUNT(film_id) AS "Total Not in Inventory"
FROM film
WHERE film_id NOT IN
(SELECT film_id
FROM inventory);

# Query 15
# 15. Create a query that lists all of the film ids for any movies that contain the actor with the title "RIP CRAWFORD".
# Do not use the actor's ID in the query. Display Film IDs in Ascending order.

SELECT film_actor.film_id AS "Film ID"
FROM film_actor, actor
WHERE film_actor.actor_id = actor.actor_id AND
      first_name LIKE 'RIP' AND last_name LIKE 'CRAWFORD'
ORDER BY film_id;





