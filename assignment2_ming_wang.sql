/** 
 ** Name: Ming Wang
 ** Assignment: 2
 ** Date: September 22nd, 2023
 **/
 
 --Q1:
SELECT e.employee_id, 
	   c.country_name
FROM Employees e
	JOIN Departments d 
	  ON e.department_id = d.department_id
	JOIN Locations l 
	  ON d.location_id = l.location_id
	JOIN Countries c 
	  ON l.country_id = c.country_id;
		
--Q2:
SELECT d.department_name, 
       e.first_name, 
       e.last_name, 
       j.job_title, 
       e.salary
FROM Departments d
	JOIN Employees e 
	  ON d.manager_id = e.employee_id
	JOIN Jobs j 
	  ON e.job_id = j.job_id;
	  
--Q3:
SELECT d.department_name, 
       l.city, 
       c.country_name, 
       r.region_name
FROM Departments d
	JOIN Locations l 
	  ON d.location_id = l.location_id
	JOIN Countries c 
	  ON l.country_id = c.country_id
	JOIN Regions r 
	  ON c.region_id = r.region_id
WHERE r.region_name = 'Europe';

--Q4:
SELECT e.first_name, 
	   e.last_name, 
       j.job_title, 
       jh.job_id, 
       jh.end_date, 
       j.max_salary
FROM Job_History jh
    JOIN Employees e 
      ON jh.employee_id = e.employee_id
    JOIN Jobs j 
      ON jh.job_id = j.job_id
WHERE jh.employee_id IN (176, 200, 101, 102)
ORDER BY e.last_name DESC, 
         jh.end_date ASC;
		 
--Q5:
SELECT e.employee_id, 
       e.first_name, 
       e.last_name, 
       j.job_title, 
       j.max_salary
FROM Employees e
	JOIN Jobs j 
	  ON e.job_id = j.job_id
WHERE j.max_salary >= 9000
ORDER BY j.max_salary DESC;

--Q6:
SELECT d.manager_id AS "Manager ID", 
       e.first_name AS "First Name", 
       e.last_name AS "Last Name", 
       d.department_name AS "Department Name", 
       l.city AS "City Name"
FROM Departments d
	JOIN Employees e 
	  ON d.manager_id = e.employee_id
	JOIN Locations l 
	  ON d.location_id = l.location_id
WHERE l.city = 'Seattle';

--Q7:
SELECT l.location_id AS "Location ID", 
       l.city AS "City Name"
FROM Locations l
	LEFT JOIN Departments d 
		ON l.location_id = d.location_id
WHERE d.department_id IS NULL 
	AND l.country_id <> (SELECT country_id 
						 FROM Countries 
						 WHERE country_name = 'Mexico');

						 
--Q8:
SELECT first_name AS "Name"
FROM Employees
INTERSECT
SELECT last_name AS "Name"
FROM Employees;

--Q9:
SELECT c.country_name, 
       'No City' AS "City Name"
FROM Countries c
	LEFT JOIN Locations l 
	  ON c.country_id = l.country_id
WHERE l.location_id IS NULL
UNION
SELECT 'No Country' AS "Country Name", 
       l.city AS "City Name"
FROM Locations l
	LEFT JOIN Countries c 
	  ON l.country_id = c.country_id
WHERE c.country_id IS NULL;
