CREATE TABLE People(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(200) NOT NULL,
	Birthdate datetime NOT NULL
)

GO

INSERT INTO People(Name, Birthdate) VALUES
('Victor', '2000-12-07'),
('Steven', '1992-09-10'),
('Stephen', '1910-09-19'),
('John', '2010-01-06')

GO

SELECT 
	Name,
	DATEDIFF(year, Birthdate, GETDATE()) AS [Age in Years],
	DATEDIFF(month, Birthdate, GETDATE()) AS [Age in Months], 
	DATEDIFF(day, Birthdate, GETDATE()) AS [Age in Days], 
	DATEDIFF(minute, Birthdate, GETDATE()) AS [Age in Minutes]
	FROM People