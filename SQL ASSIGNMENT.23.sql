USE HR;


1. Display all information in the tables EMP and DEPT. 

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;



2. Display only the hire date and employee name for each employee.  

SELECT HIRE_DATE, FIRST_NAME, LAST_NAME
FROM EMPLOYEES;


3. Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title 

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME, JOB_ID) AS "EMPLOYEE AND TITLE"
FROM EMPLOYEES;


4. Display the hire date, name and department number for all clerks.  

SELECT HIRE_DATE, CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = "CLERK";



5. Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT  

SELECT CONCAT(FIRST_NAME,',', LAST_NAME,',', JOB_ID,',', HIRE_DATE,',', EMAIL,',', PHONE_NUMBER,',', SALARY,',', COMMISSION_PCT,',', MANAGER_ID,',', DEPARTMENT_ID) AS "THE OUTPUT"
FROM EMPLOYEES;



6. Display the names and salaries of all employees with a salary greater than 2000.  

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 2000;



7. Display the names and dates of employees with the column headers "Name" and "Start 
Date"   

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS "NAME", HIRE_DATE AS "START_DATE"
FROM EMPLOYEES;



8. Display the names and hire dates of all employees in the order they were hired.  

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME), HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE;


9. Display the names and salaries of all employees in reverse salary order.  

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME), SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;


10. Display 'ename' and 'deptno' who are all earned commission and display salary in 
reverse order.  
  
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC;


11. Display the last name and job title of all employees who do not have a manager  

SELECT LAST_NAME, JOB_TITLE
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;


12. Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

SELECT LAST_NAME, SALARY
FROM EMPLOYEES 
WHERE (JOB_ID = "SALES REPRESENTATIVE" OR JOB_ID = "STOCK CLERK")
AND SALARY NOT IN (2500, 3500, 5000);


13. Display the maximum, minimum and average salary and commission earned.
   
SELECT MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY, AVG(SALARY) AS AVG_SALARY, AVG(COMMISSION_PCT) AS AVG_COMMISSION_PCT, MAX(COMMISSION_PCT) AS MAX_COMMISSION_PCT, MIN(COMMISSION_PCT) AS MIN_COMMISSION_PCT
FROM EMPLOYEES;


14. Display the department number, total salary payout and total commission payout for 
each department.

SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY_PAYOUT, SUM(COMMISSION_PCT) AS TOTAL_COMMISSION_PAYOUT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


15. Display the department number and number of employees in each department.
   
SELECT DEPARTMENT_ID, COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


16. Display the department number and total salary of employees in each department. 

SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


17. Display the employee's name who doesn't earn a commission. Order the result set 
without using the column name
  
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL
ORDER BY 1;


18. Display the employees name, department id and commission. If an Employee doesnt  
earn the commission, then display as 'No commission'. Name the columns appropriately
 
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME, DEPARTMENT_ID
FROM EMPLOYEES 
WHERE COMMISSION_PCT IS NULL;



19. Display the employees name, salary and commission multiplied by 2. If an Employee 
doesnt earn the commission, then display as 'No commission'. Name the columns 
appropriately  

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME, CONCAT(COMMISSION_PCT * 2, "NO COMMISSION") AS COMMISSION
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;


20. Display the employees name, department id who have the first name same as another 
employee in the same department

SELECT CONCAT(E.FIRST_NAME,' ', E.LAST_NAME) , E.DEPARTMENT_ID
FROM EMPLOYEES E
JOIN EMPLOYEES D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.FIRST_NAME = D.FIRST_NAME
AND E.EMPLOYEE_ID = D.EMPLOYEE_ID;


21. Display the sum of salaries of the employees working under each Manager.  

SELECT MANAGER_ID, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY MANAGER_ID;


22. Select the Managers name, the count of employees working under and the department 
ID of the manager. 

SELECT CONCAT(M.FIRST_NAME,' ', M.LAST_NAME) AS MANAGER_NAME, COUNT(E.EMPLOYEE_ID)AS EMPLOYEE_COUNT, D.DEPARTMENT_ID
FROM EMPLOYEES M
LEFT JOIN EMPLOYEES E ON M.EMPLOYEE_ID = E.EMPLOYEE_ID
GROUP BY  D.DEPARTMENT_ID;


23. Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a'!

SELECT CONCAT(E.FIRST_NAME,' ', E.LAST_NAME) AS EMPLOYEE_NAME, E.DEPARTMENT_ID, E.SALARY, M.MANAGER_ID 
FROM EMPLOYEES E
JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
WHERE E.LAST_NAME LIKE "_a%"
GROUP BY E.EMPLOYEE_ID, E.DEPARTMENT_ID, E.SALARY;


24. Select the maximum salary of each department along with the department id   

SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


25. Display the commission, if not null display 10% of salary, if null display a default value 1

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME, SALARY, COALESCE(COMMISSION_PCT, 0.10) * SALARY AS COMMISSION 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;


26. Write a query to display the last name, department number, department name for all 
employees.
  
SELECT E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


27. Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output.

SELECT DISTINCT E.JOB_ID, D.LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID = 4;


28. Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission.
 
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.DEPARTMENT_ID = L.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL;


29. Display the employee last name and department name of all employees who have an 'a' 
in their last name 

SELECT E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.LAST_NAME LIKE "%a%";


30. Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA.   

SELECT E.LAST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = "ATLANTA";



31. Display the employee last name and employee number along with their managers last 
name and manager number. 

SELECT E.LAST_NAME AS EMPLOYEE_NAME, E.EMPLOYEE_ID AS EMPLOYEE_NUMBER, M.LAST_NAME AS MANAGER_LAST_NAME, M.EMPLOYEE_ID AS MANAGER_NUMBER
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;




32. Display the employee last name and employee number along with their managers last 
name and manager number (including the employees who have no manager).

SELECT E.LAST_NAME, E.EMPLOYEE_ID, M.EMPLOYEE_ID, M.LAST_NAME
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY E.EMPLOYEE_ID;



33. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee.

SELECT E1.LAST_NAME, E1.DEPARTMENT_ID, E2.LAST_NAME
FROM EMPLOYEES E1
JOIN EMPLOYEES E2
ON E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
WHERE E1.LAST_NAME !=E2.LAST_NAME;



34. Create a query that displays the name,job,department name,salary,grade for all 
employees.  Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)   

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS FULL_NAME, JOB_ID, DEPARTMENT_NAME, SALARY,
CASE
WHEN SALARY >= 50000 THEN 'A'
WHEN SALARY >= 30000 THEN 'B'
WHEN SALARY < 30000 THEN 'C'
END AS GRADE
FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID);




35. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus.  

SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE_NAME 
FROM EMPLOYEES 
WHERE SALARY = 2000;



36. Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A.

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
COALESCE(ADDRESS, 'N/A') AS ADDRESS, CITY, STATE
FROM EMPLOYEES
WHERE CITY = 'CA';



37. Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product.

SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
FROM DEPARTMENTS 
WHERE DEPARTMENT_NAME = 'SALES');



38. Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary. 

SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY ASC;


39. Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a u   

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
FROM EMPLOYEES 
WHERE LAST_NAME LIKE '%u%');



40. Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA. 

SELECT E.LAST_NAME, E.DEPARTMENT_ID, E.JOB_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'ATLANTA';



41. Display the last name and salary of every employee who reports to FILLMORE.  

SELECT E.LAST_NAME, E.SALARY 
FROM EMPLOYEE E
JOIN EMPLOYEES M ON E.MANAGER_ID = M.MANAGER_ID
WHERE M.LAST_NAME = 'FILLMORE';



42. Display the department number, last name, and job ID for every employee in the 
OPERATIONS department. 

SELECT DEPARTMENT_ID, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS 
WHERE DEPARTMENT_NAME = 'OPERATIONS');


43. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name.  

SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES 
WHERE LAST_NAME LIKE '%u%');



44. Display the names of all employees whose job title is the same as anyone in the sales 
dept.   

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES 
WHERE JOB_ID 
IN (SELECT JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID
= (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'SALES'));



45. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries.  

SELECT LAST_NAME, SALARY
FROM EMPLOYEES 
ORDER BY SALARY DESC
FETCH FIRST 3 ROWS ONLY;



46. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column  

SELECT FIRST_NAME, LAST_NAME, SALARY, COALESCE(COMMISSION_PCT, 0)
AS COMMISSSION 
FROM EMPLOYEES;



47. Display the Managers (name) with top three salaries along with their salaries and 
department information. 

SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY, D.DEPARTMENT_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON 
E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID FROM EMPLOYEES)
ORDER BY E.SALARY DESC;



48. Write a query to display the employees last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label. 

SELECT LAST_NAME AS 'EMPLOYEE_LAST_NAME', 
CASE 
WHEN SALARY / 2 > 10000
THEN SALARY * 1.10 
ELSE SALARY * 1.115 
END AS "ADJUSTED_SALARY",
1500 AS "BONUS-AMOUNT"
FROM EMPLOYEES;



49. Display the employees name if it is a palindrome

SELECT LAST_NAME 
FROM EMPLOYEES
WHERE UPPER(LAST_NAME) =
REVERSE(UPPER(LAST_NAME));



50. Display First names of all employees with initcaps. 

SELECT INTICAP(FIRST_NAME) AS 'FORMATTED_FIRST_NAME'
FROM EMPLOYEES;



51. Display the names and job titles of all employees with the same job as Trenna.   

SELECT E1.FIRST_NAME, E1.LAST_NAME, E1.JOB_ID
FROM EMPLOYEES E1
JOIN EMPLOYEES E2 ON E1.JOB_ID = E2.JOB_ID
WHERE E2.FIRST_NAME = 'TRENNA' OR E2.LAST_NAME = 'TRENNA'; 




52. Display the names and department name of all employees working in the same city as 
Trenna. 

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID 
FROM EMPLOYEES E 
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID 
WHERE E.FIRST_NAME = 'TRENNA' OR E.LAST_NAME = 'TRENNA';



53. Display the name of the employee whose salary is the lowest.

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES 
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);



54. Display the names of all employees except the lowest paid. 

SELECT FIRST_NAME, LAST_NAME 
FROM EMPLOYEES 
WHERE SALARY > (SELECT MIN(SALARY) FROM EMPLOYEES );





