1. Create the Employees table
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);
 2. Insert 3 records using different INSERT INTO approaches
Single-row insert:
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alice Johnson', 6000.00);
Another single-row insert (alternative syntax):
INSERT INTO Employees
VALUES (2, 'Bob Smith', 5500.00);
Multiple-row insert:
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
    (3, 'Charlie Lee', 5000.00),
    (4, 'Diana Prince', 6200.00);  -- Extra record for testing purposes
 3. Update the Salary of employee with EmpID = 1 to 7000
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;
 4. Delete a record where EmpID = 2
DELETE FROM Employees
WHERE EmpID = 2;
 5. Difference between DELETE, TRUNCATE, and DROP
Command	Description
DELETE	Removes specific rows from a table based on a condition. Can be rolled back (if inside a transaction). Table structure remains.
TRUNCATE	Removes all rows from a table quickly. Cannot delete specific rows. Usually cannot be rolled back. Table structure remains.
DROP	Completely removes the table and its structure from the database. Cannot be rolled back.

 6. Modify Name column to VARCHAR(100)
ALTER TABLE Employees
MODIFY COLUMN Name VARCHAR(100);
Note: In some databases like SQL Server, use ALTER COLUMN instead of MODIFY COLUMN.

 7. Add a new column Department (VARCHAR(50))
ALTER TABLE Employees
ADD Department VARCHAR(50);
 8. Change the data type of Salary to FLOAT
ALTER TABLE Employees
MODIFY COLUMN Salary FLOAT;
Again, in SQL Server:

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;
 9. Create Departments table

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
 10. Remove all records from Employees without deleting structure

TRUNCATE TABLE Employees;
 11. Insert 5 records into Departments using INSERT INTO ... SELECT
We can use UNION ALL to simulate the selection of hardcoded values:


INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'Management'
UNION ALL
SELECT 2, 'Finance'
UNION ALL
SELECT 3, 'Human Resources'
UNION ALL
SELECT 4, 'IT'
UNION ALL
SELECT 5, 'Marketing';
12. Update Department of all employees where Salary > 5000 to 'Management'

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
13. Remove all employees but keep the table structure intact

TRUNCATE TABLE Employees;
TRUNCATE deletes all rows but preserves table structure, unlike DROP.

14. Drop the Department column from Employees

ALTER TABLE Employees
DROP COLUMN Department;
15. Rename the Employees table to StaffMembers

ALTER TABLE Employees
RENAME TO StaffMembers;
In SQL Server, the syntax is different:


EXEC sp_rename 'Employees', 'StaffMembers';
16. Completely remove the Departments table from the database

DROP TABLE Departments;
17. Create a table Products with at least 5 columns and a CHECK constraint on Price

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Description TEXT
);
18. Modify the table to add a StockQuantity column with a DEFAULT value of 50

ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;
19. Rename Category to ProductCategory

ALTER TABLE Products
RENAME COLUMN Category TO ProductCategory;

20. Insert 5 records using INSERT INTO

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
    (1, 'Laptop', 'Electronics', 1200.00, 'High-performance laptop'),
    (2, 'Smartphone', 'Electronics', 800.00, 'Latest model smartphone'),
    (3, 'Office Chair', 'Furniture', 150.00, 'Ergonomic office chair'),
    (4, 'Coffee Maker', 'Appliances', 90.00, 'Programmable coffee maker'),
    (5, 'Desk Lamp', 'Lighting', 25.00, 'LED desk lamp with USB port');
21. Create a backup table Products_Backup using SELECT INTO

SELECT *
INTO Products_Backup
FROM Products;
Note: SELECT INTO both creates and populates the new table.

22. Rename Products table to Inventory

ALTER TABLE Products
RENAME TO Inventory;

23. Alter Inventory table to change Price from DECIMAL(10,2) to FLOAT

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;
In MySQL, use:


ALTER TABLE Inventory

24. Add an IDENTITY column ProductCode starting at 1000, incrementing by 5


ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
In MySQL (does not support IDENTITY, but similar result using AUTO_INCREMENT):
You would need to recreate the table or use a workaround.


ADD ProductCode SERIAL;
-- To make it start at 1000 and increment by 5:
CREATE SEQUENCE product_code_seq START 1000 INCREMENT 5;
ALTER TABLE Inventory
ADD COLUMN ProductCode INT DEFAULT nextval('product_code_seq');
