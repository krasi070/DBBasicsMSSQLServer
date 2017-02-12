USE TableRelationsExercise

CREATE TABLE Passports(
	PassportID int IDENTITY(101, 1) PRIMARY KEY NOT NULL,
	PassportNumber char(8) NOT NULL
)

INSERT INTO Passports(PassportNumber) VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

CREATE TABLE Persons(
	PersonID int IDENTITY PRIMARY KEY NOT NULL,
	FirstName varchar(255) NOT NULL,
	Salary money NOT NULL,
	PassportID int UNIQUE NOT NULL,
	CONSTRAINT FK_Persons_Passports
	FOREIGN KEY (PassportID)
	REFERENCES Passports(PassportID)
)

INSERT INTO Persons(FirstName, Salary, PassportID) VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)