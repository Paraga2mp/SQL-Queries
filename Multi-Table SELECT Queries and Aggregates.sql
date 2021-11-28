
#########################################################################################################                                                                                       #
# Name: Ashraf Mamun                                                                                    #                                                                                 #
#########################################################################################################


USE sakila;

# Query 1: Create a query that displays a list of Sakila stores (IDs) and the first/last name of each store's manager.

SELECT store.store_id AS "Store ID", staff.first_name AS "First Name", staff.last_name AS "Last Name"
FROM store, staff
WHERE store.manager_staff_id = staff.staff_id;


# Query 2: Create a query that displays a list of all cities and their associated countries, alphabetized by country.

SELECT city AS City, country AS Country
FROM city INNER JOIN country ON city.country_id = country.country_id
ORDER BY country.country;



# Query 3: Create a query that displays the names of every actor and the number of movies they are in. Display
# the actor's last and first names and sort from most movies to least. Rename columns as indicated.


SELECT  actor.last_name AS "Last Name", actor.first_name AS "First Name", COUNT(film_actor.film_id) AS "No of Movies"
FROM actor
    INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY COUNT(film_actor.actor_id) DESC;


# Query 4:	Create a query that displays a list of all customers who currently reside in Japan. Show their last and first
# names, city and country, sorted by city of residence, then by customer last name, first name.

SELECT customer.customer_id AS Customer_ID, customer.last_name AS "Last Name", customer.first_name AS "First Name", city.city AS City, country.country AS Country
FROM customer INNER JOIN address ON customer.address_id = address.address_id
              INNER JOIN city ON address.city_id = city.city_id
              INNER JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Japan'
ORDER BY city.city, customer.last_name, customer.first_name;


# Query 5: Create a query that lists all G-rated movies in which actress Audrey Olivier has appeared. Display the actress' name in a
# single field named ActorName. Rename other columns as indicated.

SELECT CONCAT(actor.last_name, ', ', actor.first_name) AS "Actor Name", film.title AS Movie, film.rating AS "Movie Rating"
FROM actor INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
            INNER JOIN film ON film_actor.film_id = film.film_id
WHERE actor.first_name LIKE 'Audrey' AND actor.last_name LIKE 'Olivier' AND film.rating = 'G';


# Query 6: Create a query that displays the total profits per staff member for rentals returned in July of 2005. Rename columns as indicated.

SELECT first_name AS "First Name", last_name AS "Last Name", SUM(amount) AS "Profit on Returned - July 2005"
FROM staff INNER JOIN payment p on staff.staff_id = p.staff_id
            INNER JOIN rental r on p.rental_id = r.rental_id
WHERE return_date >= '2005-07-00%' AND return_date <= '2005-08-00%'
GROUP BY p.staff_id
ORDER BY p.staff_id DESC;



# Query 7: Create a query that displays which and how many movies are available for rental from store #1, that have an R  rating, are 2 hours or less in run time,
# and that include deleted scenes as a special feature. Sort by movie length, from shortest to longest. Rename the Available column as indicated.


SELECT film.title AS Movie, COUNT(i.film_id) AS "# Available", film.rating AS Rating, film.length AS Length, film.special_features AS "Special Feature"
FROM film INNER JOIN inventory i on film.film_id = i.film_id
            INNER JOIN store ON i.store_id = store.store_id
WHERE store.store_id = 1 AND
      film.rating = 'R' AND length <=120 AND
      film.special_features LIKE '%Deleted Scenes%'
GROUP BY film.title, film.length, film.special_features
ORDER BY film.length;


# Query 8: Create a query that displays the top five actors that have made the most rental profits for our store, sorted from largest profit to smallest.
# Rename columns as indicated.

SELECT actor.last_name AS "Last Name", actor.first_name AS "First Name", SUM(payment.amount) AS "Total Profit By Actor"
FROM actor INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
            INNER JOIN film ON film.film_id = film_actor.film_id
            INNER JOIN inventory ON film.film_id = inventory.film_id
            INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
            INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film_actor.actor_id
ORDER BY SUM(payment.amount) DESC
LIMIT 5;


# Query 9: Create a query that displays all movies from the Action or Comedy categories that were rented by Canadian customers, sorted by movie title.
# Display the name of the rented movie, its category, the customer's name as a single field and the country. Rename columns as indicated.

SELECT film.title AS MovieRented, category.name AS Category, CONCAT(customer.first_name, ' ', customer.last_name) AS Customer, country.country AS Country
FROM film INNER JOIN film_category ON film.film_id = film_category.film_id
            INNER JOIN category ON film_category.category_id = category.category_id
        INNER JOIN inventory ON film.film_id = inventory.film_id
        INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
        INNER JOIN customer ON rental.customer_id = customer.customer_id
        INNER JOIN address ON address.address_id = customer.address_id
        INNER JOIN city ON address.city_id = city.city_id
        INNER JOIN country ON country.country_id = city.country_id
WHERE country.country LIKE 'Canada'
    AND (category.name = 'Comedy' OR category.name = 'Action')
ORDER BY title;


# Query 10: Create a query that displays how many movies were rented by customer Ruby Washington,
# listed by category. Display the customer's last and first names, the category and how many movies
# from each category were rented by this customer. Sort by category, then by customer last name.
# Rename columns as indicated.

SELECT customer.last_name AS LastName, customer.first_name AS FirstName,
       category.name AS Category, COUNT(rental.customer_id) AS "# of Rented"
FROM customer   INNER JOIN rental ON customer.customer_id = rental.customer_id
                INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
                INNER JOIN film ON inventory.film_id = film.film_id
                INNER JOIN film_category ON film.film_id = film_category.film_id
                INNER JOIN category ON film_category.category_id = category.category_id
WHERE customer.first_name = 'Ruby' AND customer.last_name = 'Washington'
GROUP BY category.category_id
ORDER BY category.name, customer.last_name;


