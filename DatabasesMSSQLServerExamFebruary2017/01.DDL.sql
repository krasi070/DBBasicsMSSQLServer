CREATE DATABASE Bakery

GO

USE Bakery

CREATE TABLE Countries(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Name nvarchar(50) UNIQUE NOT NULL
)

CREATE TABLE Distributors(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Name nvarchar(25) UNIQUE NOT NULL,
	AddressText nvarchar(30),
	Summary nvarchar(200),
	CountryId int FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE Products(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Name nvarchar(25) UNIQUE NOT NULL,
	Description nvarchar(250),
	Recipe nvarchar(max),
	Price money NOT NULL CHECK(Price > 0)
)

CREATE TABLE Ingredients(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Name nvarchar(30),
	Description nvarchar(200),
	OriginCountryId int FOREIGN KEY REFERENCES Countries(Id),
	DistributorId int FOREIGN KEY REFERENCES Distributors(Id)
)

CREATE TABLE ProductsIngredients(
	ProductId int FOREIGN KEY REFERENCES Products(Id),
	IngredientId int FOREIGN KEY REFERENCES Ingredients(Id),
	CONSTRAINT PK_ProductsIngridients PRIMARY KEY (ProductId, IngredientId)
)

CREATE TABLE Customers(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	FirstName nvarchar(25),
	LastName nvarchar(25),
	Gender char(1) CHECK(Gender = 'M' OR Gender = 'F'),
	Age int,
	PhoneNumber char(10),
	CountryId int FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE Feedbacks(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Description nvarchar(255),
	Rate decimal(4, 2) CHECK(Rate BETWEEN 0 AND 10),
	ProductId int FOREIGN KEY REFERENCES Products(Id),
	CustomerId int FOREIGN KEY REFERENCES Customers(Id)
)