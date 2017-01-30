CREATE DATABASE SoftUni

CREATE TABLE Towns(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(100) NOT NULL
)

CREATE TABLE Addresses(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	AddressText varchar(200) NOT NULL,
	TownId int FOREIGN KEY REFERENCES Towns(Id) NOT NULL 
)

CREATE TABLE Departments(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(100) NOT NULL
)

CREATE TABLE Employees(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	FirstName varchar(100) NOT NULL,
	MiddleName varchar(100),
	LastName varchar(100) NOT NULL,
	JobTitle varchar(100) NOT NULL,
	DepartmentId varchar(100) NOT NULL,
	HireDate date,
	Salary money NOT NULL,
	AddressId int FOREIGN KEY REFERENCES Addresses(Id)
)