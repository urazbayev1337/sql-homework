1)SELECT TRIM(SPLIT_PART(Name, ',', 1)) AS Name, TRIM(SPLIT_PART(Name, ',', 2)) AS Surname FROM TestMultipleColumns;
2)SELECT * FROM TestPercent WHERE StringColumn LIKE '%[%]%';
3)SELECT value AS Part FROM Splitter CROSS APPLY STRING_SPLIT(StringColumn, '.');
4)SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(StringColumn,'0','X'),'1','X'),'2','X'),'3','X'),'4','X'),'5','X'),'6','X'),'7','X'),'8','X'),'9','X') AS ReplacedString FROM [1234ABC123456XYZ1234567890ADS];
5)SELECT * FROM testDots WHERE (LENGTH(Vals) - LENGTH(REPLACE(Vals, '.', ''))) > 2;
6)SELECT LENGTH(StringColumn) - LENGTH(REPLACE(StringColumn, ' ', '')) AS SpaceCount FROM CountSpaces;
7)SELECT e.EmployeeID, e.EmployeeName, e.Salary, m.EmployeeName AS ManagerName, m.Salary AS ManagerSalary FROM Employee e JOIN Employee m ON e.ManagerID = m.EmployeeID WHERE e.Salary > m.Salary;
8)SELECT EmployeeID, FirstName, LastName, HireDate, FLOOR(DATEDIFF(year, HireDate, GETDATE())) AS YearsOfService FROM Employees WHERE DATEDIFF(year, HireDate, GETDATE()) > 10 AND DATEDIFF(year, HireDate, GETDATE()) < 15;
9)SELECT STRING_AGG(CASE WHEN value LIKE '[0-9]' THEN value END, '') AS Integers, STRING_AGG(CASE WHEN value LIKE '[A-Za-z]' THEN value END, '') AS Characters FROM (SELECT SUBSTRING(column_name, number, 1) AS value FROM your_table JOIN master..spt_values ON number BETWEEN 1 AND LEN(column_name) WHERE type = 'P') AS chars;
10)SELECT w1.Id FROM weather w1 JOIN weather w2 ON DATEADD(day, -1, w1.Date) = w2.Date WHERE w1.Temperature > w2.Temperature;
11)SELECT PlayerId, MIN(LoginDate) AS FirstLoginDate FROM Activity GROUP BY PlayerId
12)SELECT Fruit FROM (SELECT Fruit, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn FROM fruits) AS t WHERE rn = 3;
13)SELECT SUBSTRING('sdgfhsdgfhs@121313131', number, 1) AS Character FROM master..spt_values WHERE type='P' AND number BETWEEN 1 AND LEN('sdgfhsdgfhs@121313131');
14)SELECT p1.id, CASE WHEN p1.code = 0 THEN p2.code ELSE p1.code END AS code FROM p1 JOIN p2 ON p1.id = p2.id;
15)SELECT EmployeeId, FirstName, LastName, HIRE_DATE, CASE WHEN DATEDIFF(year, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'  WHEN DATEDIFF(year, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'  WHEN DATEDIFF(year, HIRE_DATE, GETDATE()) BETWEEN 6 AND 10 THEN 'Mid-Level'  WHEN DATEDIFF(year, HIRE_DATE, GETDATE()) BETWEEN 11 AND 20 THEN 'Senior'  ELSE 'Veteran'  END AS EmploymentStage FROM Employees;
16)SELECT LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'a') - 1) AS StartingInteger FROM GetIntegers;
17)SELECT Id, CASE WHEN LEN(Vals) >= 2 THEN SUBSTRING(Vals, 2, 1) + SUBSTRING(Vals, 1, 1) + SUBSTRING(Vals, 3, LEN(Vals)) ELSE Vals END AS SwappedVals FROM MultipleVals;
18)SELECT player_id, device_id, event_date FROM Activity A WHERE event_date = (SELECT MIN(event_date) FROM Activity WHERE player_id = A.player_id)
WITH SalesWithTotal AS (SELECT Area, [Date], ISNULL(SalesLocal, 0) + ISNULL(SalesRemote, 0) AS TotalSales, FinancialWeek, FinancialYear FROM WeekPercentagePuzzle), WeeklyTotals AS (SELECT FinancialWeek, FinancialYear, SUM(TotalSales) AS WeekTotalSales FROM SalesWithTotal GROUP BY FinancialWeek, FinancialYear) SELECT s.Area, s.[Date], s.TotalSales, w.WeekTotalSales, CASE WHEN w.WeekTotalSales = 0 THEN 0 ELSE ROUND((s.TotalSales * 100.0) / w.WeekTotalSales, 2) END AS PercentageOfWeekSales FROM SalesWithTotal s JOIN WeeklyTotals w ON s.FinancialWeek = w.FinancialWeek AND s.FinancialYear = w.FinancialYear ORDER BY s.FinancialYear, s.FinancialWeek, s.Area, s.[Date];
