-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.productname
    , c.categoryname
FROM product 
    AS p
JOIN category
    AS c
    ON p.categoryid = c.id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECt o.id
    , s.companyname
FROM [order]
    AS o
JOIN shipper
    AS s
    ON o.shipvia = s.id
WHERE o.orderdate < "2012-08-09"
-- SELECT o.id
--     , o.shipname
-- FROM [order] 
--     AS o
-- WHERE o.OrderDate < "2012-08-09";
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.productname
    , od.quantity
FROM orderdetail
    AS od
JOIN product
    AS p
    ON od.productid = p.id
WHERE od.id LIKE "%10251%"
ORDER BY p.productname;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.id AS OrderID
    , c.companyname AS CompanyName
    , e.lastname AS EmployeeLastName
FROM [order]
    AS o
JOIN customer
    AS c
    ON o.customerid = c.id
JOIN employee
    AS e
    ON o.employeeid = e.id;