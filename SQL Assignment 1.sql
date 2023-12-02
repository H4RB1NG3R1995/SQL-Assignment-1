use mavenmovies;

-- Q1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences.

-- QUERY FOR PRIMARY KEY
SELECT TABLE_NAME, COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME = 'PRIMARY' AND TABLE_SCHEMA = 'mavenmovies';

-- QUERY FOR FOREIGN KEY
SELECT TABLE_NAME, COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME LIKE "fk%" AND TABLE_SCHEMA = 'mavenmovies';

/*The following points explain the differences between primary and foreign keys:

1. A primary key constraint in the relational database acts as a unique identifier for every row in the table. In contrast, a foreign key constraint establishes a relationship between two different tables to uniquely identify a row of the same table or another table.
2. The primary key column does not store NULL values, whereas the foreign key can accept more than one NULL value.
3. Each table in a relational database can't define more than one primary key while we can specify multiple foreign keys in a table.
4. We can't remove the parent table's primary key value, which is referenced with a foreign key column in the child table. In contrast, we can delete the child table's foreign key value even though they refer to the parent table's primary key.
5. A primary key is a unique and non-null constraint, so no two rows can have identical values for a primary key attribute, whereas foreign key fields can store duplicate values.
6. We can insert the values into the primary key column without any limitation. In contrast, we need to ensure that the value is present in a primary key column while inserting values in the foreign key table.
7. We can implicitly define the primary key constraint on temporary tables, whereas we cannot enforce foreign key constraints on temporary tables.
*/

-- Q2. List all details of actors

select *
from actor;

-- Q3. List all customer information from DB.

select *
from customer;

-- Q4. List different countries.

select country
from country;

-- Q5. Display all active customers.

select * 
from customer
where active = 1;

-- Q6. List of all rental IDs for customer with ID 1

select customer_id, rental_id
from rental
where customer_id = 1;

-- Q7. Display all the films whose rental duration is greater than 5.

select * 
from film
where rental_duration > 5
order by rental_duration;

-- Q8. List the total number of films whose replacement cost is greater than $15 and less than $20.

select *
from film
where replacement_cost > 15 and replacement_cost < 20
order by replacement_cost;

-- Q9. Display the count of unique first names of actors.

select count(distinct first_name) as CountofUniqueFirstName
from actor;

-- Q10. Display the first 10 records from the customer table.

select * 
from customer
limit 10;

-- Q11. Display the first 3 records from the customer table whose first name starts with ‘b’.

select * 
from customer
where first_name like "B%"
limit 3;

-- Q12. Display the names of the first 5 movies which are rated as ‘G’.

select *
from film
where rating = "G"
limit 5;

-- Q13. Find all customers whose first name starts with "a".

select *
from customer
where first_name like "A%";

-- Q14. Find all customers whose first name ends with "a".

select *
from customer
where first_name like "%A";

-- Q15. Display the list of first 4 cities which start and end with ‘a’.

select city
from city
where city like "a%a"
limit 4;

-- Q16. Find all customers whose first name have "NI" in any position.

select *
from customer
where first_name like "%NI%";

-- Q17. Find all customers whose first name have "r" in the second position.

select *
from customer
where first_name like "_r%";

-- Q18. Find all customers whose first name starts with "a" and are at least 5 characters in length.

select * 
from customer
where first_name like "a%" and length(first_name) >= 5;

-- Q19. Find all customers whose first name starts with "a" and ends with "o".

select * 
from customer
where first_name like "a%o";

-- Q20. Get the films with pg and pg-13 rating using IN operator.

select *
from film
where rating in ("PG", "PG-13");

-- Q21. Get the films with length between 50 to 100 using between operator.

select *
from film
where length between 50 and 100;

-- Q22. Get the top 50 actors using limit operator.

select *
from actor
limit 50;

-- Q23. Get the distinct film ids from inventory table.

select distinct film_id
from inventory;