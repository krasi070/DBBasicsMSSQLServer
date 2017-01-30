CREATE TABLE People(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	Name nvarchar(200) NOT NULL,
	Picture varbinary(max),
	Height decimal(3, 2),
	Weight decimal(5, 2),
	Gender char(1) CHECK(Gender = 'm' OR GENDER = 'f') NOT NULL,
	Birthdate date NOT NULL,
	Biography nvarchar(max)
)

INSERT INTO People(Name, Picture, Height, Weight, Gender, Birthdate, Biography) VALUES
('Krasi', NULL, 1.70, 60.00, 'm', '1999-07-28', 'Loves programming.'),
('Ivan', NULL, 1.75, 65.00, 'm', '1999-12-04', 'Loves movies.'),
('Konstantin', NULL, NULL, NULL, 'm', '1999-01-15', NULL),
('Antonio', NULL, NULL, NULL, 'm', '2000-02-13', NULL),
('Martin', NULL, NULL, NULL, 'm', '1999-04-02', NULL)

SELECT * FROM People