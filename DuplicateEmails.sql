-- Write a SQL query to find all duplicate emails in a table named Person.
-- Table given by LeetCode
Create table If Not Exists Person (Id int, Email varchar(255));
Truncate table Person;
insert into Person (Id, Email) values ('1', 'a@b.com');
insert into Person (Id, Email) values ('2', 'c@d.com');
insert into Person (Id, Email) values ('3', 'a@b.com');

-- Solution 1
SELECT Email
FROM (
	SELECT COUNT(Id) AS MyCount, Email
	FROM Person
	GROUP BY Email
	ORDER BY COUNT(Id) DESC) AS EmailCount
WHERE MyCount > 1;

-- Solution 2
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Id) > 1;