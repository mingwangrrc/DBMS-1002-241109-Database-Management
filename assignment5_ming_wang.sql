/** 
 ** Name: Ming Wang
 ** Assignment: 5
 ** Date: November 23.2023
 **/
 
--Q1
SELECT CONCAT(first_name, ' ', last_name, ' can be contacted at ', phone_number) 
	AS contact_info
FROM Employees
WHERE SUBSTR(phone_number, 1, 3) = '515';

--Q2
SELECT ABS(AVG(min_salary) - AVG(max_salary)) 
	AS avg_salary_difference
FROM Jobs;

--Q3
SELECT postal_code, REPLACE(city, ' ', '') 
	AS city_no_space
FROM Locations
WHERE LENGTH(postal_code) = 5;

--Q4
SELECT RIGHT(r.region_name, 3) || RIGHT(c.country_name, 3) 
	AS new_country_name
FROM Countries c
JOIN Regions r ON c.region_id = r.region_id
ORDER BY new_country_name;

--Q5
SELECT j.job_title
FROM Employees e
JOIN Jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
HAVING COUNT(e.employee_id) = 1
ORDER BY j.job_title;

--Q6
SELECT 
    job_id, 
    COUNT(employee_id) AS "# of Employees", 
    '...' || RIGHT(CAST(ROUND(AVG(salary),0) AS VARCHAR), 5) AS "Average Pay", 
    MAX(hire_date) AS "Last Hired"
FROM Employees
GROUP BY job_id
ORDER BY COUNT(employee_id) DESC, AVG(salary) DESC;


--Q7
SELECT 
    d.department_id, 
    d.department_name, 
    COUNT(e.employee_id) AS employee_count
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE e.job_id IN ('IT_PROG', 'SA_REP')
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3;




