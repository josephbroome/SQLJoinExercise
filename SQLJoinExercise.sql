/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name as Product, c.Name as Category 
FROM products as p
INNER JOIN categories c
ON C.CategoryID = p.CategoryID
WHERE C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products as p
INNER JOIN reviews as r
ON r.ProductID = p.ProductID
WHERE r.Rating=5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) as Sum
FROM sales s
INNER JOIN employees e
ON e.EmployeeID = s.EmployeeID
group by e.FirstName, e.LastName
ORDER BY Sum DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name, c.Name
From departments d
INNER JOIN categories c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name='Appliances' OR c.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, Sum(s.Quantity) as "Total Sold" , (p.Price*sum(s.Quantity)) as "Total Price Sold"
From products p
INNER JOIN sales s
ON p.ProductID = s.ProductID
WHERE p.Name = "Eagles: Hotel California"
GROUP BY p.Name, p.Price;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products p
INNER JOIN reviews r
ON p.ProductID = r.ProductID
WHERE p.Name= "Visio TV"
LIMIT 1;



/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */  
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity
FROM sales s
INNER JOIN employees e
ON e.EmployeeID = s.EmployeeID
INNER JOIN products p
ON p.ProductID = s.SalesID;
