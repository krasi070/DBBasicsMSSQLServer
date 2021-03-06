CREATE DATABASE CarRental

CREATE TABLE Categories(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	CategoryName varchar(200) NOT NULL,
	DailyRate money NOT NULL,
	WeeklyRate money NOT NULL,
	MonthlyRate money NOT NULL,
	WeekendRate money NOT NULL
)

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
('First Cat.', 10.00, 40.00, 200.00, 12.00),
('Second Cat.', 20.00, 90.00, 250.00, 18.00),
('Third Cat.', 20.00, 90.00, 250.00, 18.00)

CREATE TABLE Cars(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	PlateNumber varchar(20) NOT NULL,
	Manufacturer varchar(100) NOT NULL,
	Model varchar(100) NOT NULL,
	CarYear int NOT NULL,
	CategoryId int FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Doors int,
	Picture varbinary(max),
	Condition varchar(200),
	Available bit NOT NULL
)

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Available) VALUES
('CT1234AK', 'Opel', '1', 1999, 1, 1),
('CT1334AK', 'Mercedes', '3', 2000, 3, 1),
('CT1221BK', 'Citroen', '2', 2010, 1, 0)

CREATE TABLE Employees(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	FirstName varchar(100) NOT NULL,
	LastName varchar(100) NOT NULL,
	Title varchar(100) NOT NULL,
	Notes varchar(200)
)

INSERT INTO Employees(FirstName, LastName, Title) VALUES
('Ivan', 'Ivanov', 'Guy 1'),
('Pesho', 'Peshov', 'Guy 2'),
('Ivanka', 'Ivankova', 'Woman 1')

CREATE TABLE Customers(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	DriverLicenceNumber varchar(20) NOT NULL,
	FullName varchar(200) NOT NULL,
	Address varchar(200) NOT NULL,
	City varchar(200) NOT NULL,
	ZIPCode varchar(10) NOT NULL,
	Notes varchar(200)
)

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City, ZIPCode) VALUES
('b61s17b891xdb', 'Boqn Boqnov', 'ul. Tsar Simeon 1', 'Sofia', '1780'),
('b61s17b191xdb', 'Diana Dianova', 'ul. Tsar Simeon 2', 'Sofia', '1780'),
('b61s37b891xdb', 'Maria Mariova', 'ul. Tsar Simeon 3', 'Sofia', '1780')

CREATE TABLE RentalOrders(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	CustomerId int FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
	CarId int FOREIGN KEY REFERENCES Cars(Id) NOT NULL,
	TankLevel float NOT NULL,
	KilometrageStart float NOT NULL,
	KilometrageEnd float NOT NULL,
	TotalKilometrage float NOT NULL,
	StartDate date NOT NULL,
	EndDate date NOT NULL,
	TotalDays int NOT NULL,
	RateApplied money NOT NULL,
	TaxRate money NOT NULL,
	OrderStatus varchar(200) NOT NULL,
	Notes varchar(200)
)

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus) VALUES
(1, 1, 1, 1, 10000, 12000, 2000, '2016-07-08', '2016-07-15', 7, 100, 20, 'No status'),
(2, 2, 2, 0.5, 10000, 12000, 2000, '2016-06-08', '2016-06-15', 7, 100, 20, 'No status'),
(3, 3, 3, 0.5, 10000, 12000, 2000, '2016-09-08', '2016-09-15', 7, 100, 20, 'No status')