-- ***********************
-- Name: Jaaved Dewan (126045178), Ishwinder Singh(175612217), Sara Nasifa Zaman(172752214)
-- Date: 02/21/23
-- Purpose: Assignment 01 DBS211
-- ***********************


-- Q1 SOLUTION --
SELECT
 e1.employeenumber,
 e1.firstname || ' ' || e1.lastname AS "Employee Name",
 o.phone AS "Phone",
 e1.extension AS "Extension",
 o.city AS "City",
 CASE
 WHEN e1.reportsto IS NULL
 THEN 'Unknow'
 ELSE TO_CHAR(e1.reportsto)
 END AS "Manager ID",
 CASE
 WHEN e1.reportsto IS NULL
 THEN 'Unknown'
 ELSE e2.firstname || ' ' || e2.lastname 
 END AS "Manager Name"
FROM
 dbs211_employees e1
LEFT JOIN 
 dbs211_employees e2 ON e1.reportsto = e2.employeenumber
JOIN
 dbs211_offices o ON e1.officecode = o.officecode
WHERE
 e1.reportsto IS NULL
ORDER BY
 o.city,
 e1.employeenumber;

-- Q2 SOLUTION --
SELECT
  e.employeenumber,
  e.firstname || ' ' || e.lastname AS "Employee Name",
  o.phone AS "Phone",
  e.extension AS "Extension",
  o.city AS "City"
FROM
  dbs211_employees e
  JOIN dbs211_offices o ON e.officecode = o.officecode
WHERE
  o.city IN ('NYC', 'Tokyo', 'Paris')
ORDER BY
  o.city,
  e.employeenumber;
  
-- Q3 SOLUTION --
SELECT 
  e1.employeenumber AS "Employee Number", 
  e1.lastname || ', ' || e1.firstname AS "Employee Name", 
  o.phone AS "Phone", 
  e1.extension AS "Extension", 
  o.city AS "City", 
  e1.reportsto AS "Manager ID", 
  e2.firstname || ' ' || e2.lastname  AS "Manager Name" 
FROM 
  dbs211_employees e1 
  LEFT JOIN dbs211_employees e2 ON e1.reportsto = e2.employeenumber
  JOIN dbs211_offices o ON e1.officecode = o.officecode
WHERE
  o.city IN ('NYC', 'Tokyo', 'Paris')
ORDER BY
  o.city,
  e1.employeenumber;

-- Q4 SOLUTION --
SELECT
    e1.employeenumber AS "Manager ID",
    e1.firstname || ' ' || e1.lastname AS "Manager Name",
    o.country,
    CASE
     WHEN e1.reportsto IS NULL
     THEN 'Does not report to anyone'
     ELSE 'Reports to ' || e2.firstname || ' ' || e2.lastname || '(' || e2.jobtitle || ')' 
     END AS "Reports To"
FROM
    dbs211_employees e1
JOIN
    dbs211_offices o ON e1.officecode = o.officecode
LEFT JOIN
    dbs211_employees e2 ON e1.reportsto = e2.employeenumber
WHERE
    e1.JOBTITLE NOT IN ('Sales Rep', 'VP Marketing')
    OR (e1.jobtitle = 'Sales Rep' AND e1.firstname = 'Mami')
ORDER BY
    e1.employeenumber;
    
-- Q5 SOLUTION --
SELECT 
    c.customernumber, 
    c.customername, 
    REPLACE(p.productcode, '_', ' ') AS productcode,
    p.msrp AS "OLD Price",
    ROUND(p.msrp * 0.9, 2) AS "New Price"
FROM 
    dbs211_customers c
    JOIN dbs211_orders o ON c.customernumber = o.customernumber
    JOIN dbs211_orderdetails od ON o.ordernumber = od.ordernumber
    JOIN dbs211_products p ON od.productcode = p.productcode
WHERE 
    p.productvendor = 'Exoto Designs' 
    AND od.quantityordered > 55
ORDER BY 
    c.customernumber;

-- Q6A SOLUTION --
SELECT DISTINCT 
o1.customernumber, 
c.customername
FROM 
dbs211_orders o1
JOIN dbs211_customers c 
ON o1.customernumber = c.customernumber
JOIN dbs211_orders o2 
ON o1.customernumber = o2.customernumber 
AND o1.ordernumber <> o2.ordernumber
ORDER BY o1.customernumber;

--Q6B SOLUTION --
SELECT 
c.customernumber, 
c.customername
FROM 
dbs211_customers c
JOIN (
    SELECT customernumber
    FROM dbs211_orders
    GROUP BY customernumber
    HAVING COUNT(DISTINCT ordernumber) = 1
) o ON c.customernumber = o.customernumber
ORDER BY c.customernumber, c.customername;