-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
Create table Person(Id INTEGER, Email TEXT);
Truncate table Person;
insert into Person (Id, Email) values ('1', 'john@example.com');
insert into Person (Id, Email) values ('2', 'bob@example.com');
insert into Person (Id, Email) values ('3', 'john@example.com');

-- Solution
DELETE FROM Person
WHERE Id IN (
	SELECT Id FROM (
		SELECT B.Id
		FROM Person A, Person B
		WHERE A.Email = B.Email AND A.Id < B.Id
	) AS MyTable
);