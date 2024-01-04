/** 
 ** Name: Ming Wang
 ** Assignment: 1
 ** Date: September 3rd, 2023
 **/

SELECT country_name
FROM countries
WHERE country_id = 'AR' AND region_id = 2;

SELECT country_name
FROM countries
WHERE country_name LIKE '% %';

SELECT city, state_province, country_id
FROM locations
WHERE country_id IN ('US', 'CA', 'MX')
ORDER BY country_id ASC;

SELECT job_id
FROM jobs
WHERE job_id LIKE 'AD_____';

SELECT location_id, department_name
FROM departments
ORDER BY location_id DESC, department_name ASC;

SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2008-01-01' AND '2008-12-31'
ORDER BY hire_date ASC;

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE 'W%'
ORDER BY first_name ASC;

SELECT department_name
FROM departments
WHERE manager_id IS NULL AND department_name LIKE '%Sales%'
ORDER BY department_name DESC;

SELECT employee_id, start_date, job_id
FROM job_history
WHERE start_date < '2000-01-01' OR job_id IN ('MK_REP', 'SA_REP')
ORDER BY start_date ASC;

SELECT job_title, max_salary, (max_salary * 1.25) AS new_max_salary
FROM jobs
WHERE max_salary * 1.25 < 10000
ORDER BY new_max_salary ASC;
