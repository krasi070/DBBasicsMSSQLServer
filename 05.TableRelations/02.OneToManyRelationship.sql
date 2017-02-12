USE TableRelationsExercise

CREATE TABLE Manufacturers(
	ManufacturerID int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(255) NOT NULL,
	EstablishedOn date NOT NULL
)

INSERT INTO Manufacturers(Name, EstablishedOn) VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

CREATE TABLE Models(
	ModelID int IDENTITY(101, 1) PRIMARY KEY NOT NULL,
	Name varchar(255) NOT NULL,
	ManufacturerID int NOT NULL,
	CONSTRAINT FK_Models_Manufacturers
	FOREIGN KEY (ManufacturerID)
	REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Models(Name, ManufacturerID) VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)