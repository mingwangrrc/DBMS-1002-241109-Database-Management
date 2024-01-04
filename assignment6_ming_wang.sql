/** 
 ** Name: Ming Wang
 ** Assignment: 6
 ** Date: December 07th, 2023
 **/
 
--Q1:

DROP VIEW IF EXISTS Department_Locations;

CREATE VIEW Department_Locations AS
SELECT DISTINCT L.city
FROM Locations L
WHERE EXISTS (
    SELECT 1
    FROM Departments D
    WHERE D.location_id = L.location_id
);

--Display Data from the View
SELECT * FROM Department_Locations;


--Q2:
DROP VIEW IF EXISTS Management_Employee_Counts;

CREATE VIEW Management_Employee_Counts AS
SELECT 
    M.first_name AS "First Name",
    M.last_name AS "Last Name",
    (SELECT COUNT(E.employee_id)
     FROM Employees E
     WHERE E.manager_id = M.employee_id) AS "Employee Count"
FROM Employees M
ORDER BY "Employee Count" DESC;

SELECT * FROM Management_Employee_Counts;

--Q3:
/*Part A:
1. The benefits of Views versus Tables?

Views can hide the complexity of the underlying database schema, 
or simplify the presentation of the data, which is useful 
when the raw data is more complex than 
what end users need to interact with.

Views can provide a level of security by restricting access to 
a subset of data from the underlying tables. 
This means you can have sensitive information in the base tables 
that are not exposed through the views.

Views act as a kind of filter or window through which 
you can present data in a certain way, s
uch as presenting aggregated data and hiding details.


2. The drawbacks of Views versus Tables?

Views do not store data themselves; 
they are a saved query that is executed when 
you call the view. Because of this, 
they might not perform as well as a table for large or complex queries.

Views cannot accept parameters for filtering or sorting. 
Instead, you would need to use a Table-Valued Function in 
SQL Server to achieve similar functionality with parameters.

Views cannot be indexed directly 
(although you can create an indexed view, 
which is materialized on the disk), 
which may lead to performance issues compared to tables.


3. The difference between a correlated query and non-correlated query?

A correlated subquery is one where the inner query 
depends on the outer query for its values. 
This means that the outer query has to be executed first, 
and for each row returned by the outer query, 
the inner query is executed. This can be less efficient 
because the inner query may be executed multiple times.

A non-correlated subquery is independent of the outer query and 
can be executed on its own. These subqueries can be executed once and 
their result reused, which can lead to better performance 
compared to correlated subqueries.


4. Explain why a subquery would be used?

Subqueries are used to combine more complex queries into 
a single SQL statement, which can be more efficient than 
running multiple separate queries and processing the results in 
the application layer.

They are also used for conditions where you need to compare
a column against a set of values that are obtained from another query. 
For example, you might want to find all employees in departments 
located in a particular city, 
which would require a subquery to first find the departments in that city.



Part B:

1. Describe the difference between a NoSql database and 
   a relational database.
   
Relational databases, PostgreSQL, 
are structured and store data in tables with rows and columns. 
They follow a schema, enforce data integrity, 
and support complex queries with joins. 
They are governed by ACID properties to ensure reliable transactions.

NoSQL databases, such as MongoDB or Cassandra, 
do not follow the traditional table-based structure 
and are more flexible in terms of data modeling. 
They can be document-oriented, key-value, wide-column, 
or graph databases. They prioritize scalability and performance 
over strict consistency, adhering to BASE properties.


2. A general scenario where NoSQL would be 
   a better choice than a relational database:
   
When you are dealing with large volumes of unstructured or 
semi-structured data and require high throughput 
and flexibility in your data model to quickly evolve with 
changing requirements, NoSQL is preferable. 
This scenario is common in big data applications and real-time web apps.


3. A general scenario where a relational database would be 
   a better choice than NoSQL:

When your application requires complex transactions, 
strong consistency, and the data is highly structured and 
interconnected, a relational database is often the better choice. 
This scenario is typical for financial systems, inventory, 
and other applications where data integrity and consistency are critical.

*/







