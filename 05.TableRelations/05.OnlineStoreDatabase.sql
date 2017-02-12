CREATE DATABASE OnlineStoreDatabase

USE OnlineStoreDatabase

CREATE TABLE Cities(
	CityID int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL
)

CREATE TABLE Customers(
	CustomerID int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL,
	Birthday date NOT NULL,
	CityID int NOT NULL,
	CONSTRAINT FK_Customers_Cities
	FOREIGN KEY (CityID)
	REFERENCES Cities(CityID)
)

CREATE TABLE Orders(
	OrderID int IDENTITY PRIMARY KEY NOT NULL,
	CustomerID int NOT NULL,
	CONSTRAINT FK_Orders_Customers
	FOREIGN KEY (CustomerID)
	REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes(
	ItemTypeID int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL
)

CREATE TABLE Items(
	ItemID int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL,
	ItemTypeID int NOT NULL
	CONSTRAINT FK_Items_ItemTypes
	FOREIGN KEY (ItemTypeID)
	REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE OrderItems(
	OrderID int NOT NULL,
	CONSTRAINT FK_OrderItems_Orders
	FOREIGN KEY (OrderID)
	REFERENCES Orders(OrderID),
	ItemID int NOT NULL,
	CONSTRAINT FK_OrderItems_Items
	FOREIGN KEY (ItemID)
	REFERENCES Items(ItemID),
	CONSTRAINT PK_OrderItems PRIMARY KEY (OrderID, ItemID)
)