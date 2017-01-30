CREATE DATABASE Hotel

CREATE TABLE Employees(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	FirstName varchar(100) NOT NULL,
	LastName varchar(100) NOT NULL,
	Title varchar(100) NOT NULL,
	Notes varchar(max)
)

INSERT INTO Employees(FirstName, LastName, Title) VALUES
('Ivan', 'Ivanov', 'Receptionist'),
('Diana', 'Dianova', 'Receptionist'),
('Ivanka', 'Ivankova', 'Receptionist')

CREATE TABLE Customers(
	AccountNumber varchar(10) PRIMARY KEY NOT NULL,
	FirstName varchar(100) NOT NULL,
	LastName varchar(100) NOT NULL,
	PhoneNumber varchar(20),
	EmergencyName varchar(100),
	EmergencyNumber varchar(20),
	Notes varchar(max)
)

INSERT INTO Customers(AccountNumber, FirstName, LastName) VALUES
('hd7821h789', 'Krasimir', 'Balchev'),
('ad7821h789', 'Krasimir', 'Falchev'),
('bd7821h789', 'Krasimir', 'Valchev')

CREATE TABLE RoomStatus(
	RoomStatus varchar(100) PRIMARY KEY NOT NULL,
	Notes varchar(max) 
)

INSERT INTO RoomStatus(RoomStatus) VALUES
('Not Cleaned'),
('Under Construction'),
('Ready')

CREATE TABLE RoomTypes(
	RoomType varchar(100) PRIMARY KEY NOT NULL,
	Notes varchar(max)
)

INSERT INTO RoomTypes(RoomType) VALUES
('One-Person Bedroom'),
('Two-Person Bedroom'),
('Three-Person Bedroom')

CREATE TABLE BedTypes(
	BedType varchar(100) PRIMARY KEY NOT NULL,
	Notes varchar(max)
)

INSERT INTO BedTypes(BedType) VALUES
('King Sized Bed'),
('Normal Bed'),
('Couch')

CREATE TABLE Rooms(
	RoomNumber int PRIMARY KEY NOT NULL,
	RoomType varchar(100) FOREIGN KEY REFERENCES RoomTypes(RoomType) NOT NULL,
	BedType varchar(100) FOREIGN KEY REFERENCES BedTypes(BedType) NOT NULL,
	Rate float NOT NULL,
	RoomStatus varchar(100) FOREIGN KEY REFERENCES RoomStatus(RoomStatus) NOT NUll,
	Notes varchar(max)
)

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus) VALUES
(101, 'One-Person Bedroom', 'Normal Bed', 0.1, 'Not Cleaned'),
(201, 'Two-Person Bedroom', 'Normal Bed', 0.15, 'Not Cleaned'),
(304, 'Three-Person Bedroom', 'Couch', 0.05, 'Ready')

CREATE TABLE Payments(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	PaymentDate date NOT NULL,
	AccountNumber varchar(10) FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
	FirstDateOccupied date NOT NULL,
	LastDateOccupied date NOT NULL,
	TotalDays int NOT NULL,
	AmountCharged money NOT NULL,
	TaxRate float NOT NULL,
	TaxAmount money NOT NULL,
	PaymentTool varchar(100) NOT NULL,
	Notes varchar(max)
)

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTool) VALUES
(1, '2016-07-08', 'hd7821h789', '2016-07-08', '2016-07-10', 2, 100, 0.2, 20, 'Cash'),
(2, '2016-08-08', 'hd7821h789', '2016-08-08', '2016-08-10', 2, 120, 0.2, 24, 'Cash'),
(3, '2016-09-08', 'bd7821h789', '2016-09-08', '2016-09-10', 2, 90, 0.2, 18, 'Credit Card')

CREATE TABLE Occupancies(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	DateOccupied date NOT NULL,
	AccountNumber varchar(10) FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
	RoomNumber int FOREIGN KEY REFERENCES Rooms(RoomNumber) NOT NULL,
	RateApplied float NOT NULL,
	PhoneCharge money NOT NULL,
	Notes varchar(max)
)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge) VALUES
(1, '2016-07-08', 'hd7821h789', 101, 0.1, 10),
(2, '2016-08-08', 'hd7821h789', 201, 0.15, 8),
(3, '2016-09-08', 'bd7821h789', 304, 0.05, 5)