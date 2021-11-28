# SQL-Queries
# Basic SQL Queries and Multi-Table SELECT Queries and Aggregates


Basic Query Requirements, using the Sakila database:

1.	Create a query that returns all film titles in alphabetical order for the language with ID = 1.
2.	Create a query that will list all the film titles containing the word “Drama” in the description. (You need only to accommodate the displayed spelling of the word.)
3.	Create a query that lists all films with the ratings 'G', 'PG, and 'PG-13' and also do not have an original language ID. Build the query to check for all conditions, 
    regardless of the data. Sort the results alphabetically by rating, then title.
4.	Create a query that lists all payment ids for amounts less than $2.99 and after the June 1st, 2005. Sort the results by payment date, then amount.
5.	Create a query that lists all cities who have 'Canada' as a country.  Build the query as if you do not know Canada's country id.  Hint: Remember you can have selects within 
    select queries. Sort the results reverse alphabetically by city name.
6.	Create a query that returns all films that either start with the letter ‘A’, or end with the letter ‘t’. Suppress any duplicate film names and sort the results in reverse 
    alphabetical order.
7.	Create a query that returns each customer ID and the count of payments they have made. Make sure you call the second column "count". Sort results by count in reverse order. 
8.	Create a query that lists the CustomerId and maximum paid by each customer.  Then modify the query to display only those records whose amount was more than $5.99. Sort from 
    highest total to lowest total, then sort by CustomerId from lowest to highest.
9.	Create a query that returns the CustomerId and the total number of items for each rental. Sort the results from the most number of items rented to least number of items 
    rented. Note: this is using a different table from the previous two queries.
10.	Create a query that returns all customers who have payments with a total over $7.00 and were served by the staff with an ID of 1. Sort the results by customer ID from 
    highest to lowest, then amount lowest to highest.
11.	Create a query that lists the CategoryId and count of films (name this column Cat_Count). Restrict your results to only those categories with more than 60 films. Sort the 
    results by the Category Count in descending order.
12.	Create a query that returns the names of the films with Actor ID 107.  Sort the movie titles alphabetically.
13.	Create a query that only lists the actor ids from actors that appear in more than 36 films. Sort from largest to smallest amount of films per actor. Rename columns as 
    indicated.
14.	Create a query that displays the total of films are not in inventory. Call the single column "Total Not In Inventory". 
15.	Create a query that lists all of the film ids for any movies that contain the actor with the title "RIP CRAWFORD". Do not use the actor's ID in the query. Display Film IDs 
    in Ascending order.


Multi-Table SELECT Queries and Aggregates Query Requirements, using the Sakila database:

1.	Create a query that displays a list of Sakila stores (IDs) and the first/last name of each store's manager.
2.	Create a query that displays a list of all cities and their associated countries, alphabetized by country.
3.	Create a query that displays the names of every actor and the number of movies they are in. Display the actor's last and first names and sort from most movies to least. 
    Rename columns as indicated.
4.	Create a query that displays a list of all customers who currently reside in Japan. Show their last and first
    names, city and country, sorted by city of residence, then by customer last name, first name.
5.	Create a query that lists all G-rated movies in which actress Audrey Olivier has appeared. Display the actress' name in a single field named ActorName. Rename other 
    columns as indicated.
6.	Create a query that displays the total profits per staff member for rentals returned in July of 2005. Rename columns as indicated.
7.	Create a query that displays which and how many movies are available for rental from store #1, that have an R  rating, are 2 hours or less in run time, and that include 
    deleted scenes as a special feature. Sort by movie length, from shortest to longest. Rename the Available column as indicated.
8.	Create a query that displays the top five actors that have made the most rental profits for our store, sorted from largest profit to smallest. Rename columns as indicated.
9.	Create a query that displays all movies from the Action or Comedy categories that were rented by Canadian customers, sorted by movie title. Display the name of the rented 
    movie, its category, the customer's name as a single field and the country. Rename columns as indicated. 
10.	Create a query that displays how many movies were rented by customer Ruby Washington, listed by category. Display the customer's last and first names, the category and how 
    many movies from each category were rented by this customer. Sort by category, then by customer last name. Rename columns as indicated.

