-- Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).
-- Return the result table in any order.
Create table If Not Exists Weather (Id int, RecordDate date, Temperature int);
Truncate table Weather;
insert into Weather (Id, RecordDate, Temperature) values ('1', '2015-01-01', '10');
insert into Weather (Id, RecordDate, Temperature) values ('2', '2015-01-02', '25');
insert into Weather (Id, RecordDate, Temperature) values ('3', '2015-01-03', '20');
insert into Weather (Id, RecordDate, Temperature) values ('4', '2015-01-04', '30');

-- Solution
SELECT B.Id 
FROM Weather A, Weather B
WHERE A.Temperature < B.Temperature 
	AND A.RecordDate < B.RecordDate
    AND DATEDIFF(B.RecordDate, A.RecordDate) = 1;