USE Minions

CREATE TABLE Minions (
	Id int PRIMARY KEY NOT NULL,
	Name nvarchar(255) NOT NULL,
	Age int
)

CREATE TABLE Towns (
	Id int PRIMARY KEY NOT NULL,
	Name nvarchar(255) NOT NULL
)