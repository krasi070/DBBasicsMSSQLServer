CREATE DATABASE Movies

CREATE TABLE Directors(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	DirectorName nvarchar(200) NOT NULL,
	Notes nvarchar(max)
)

INSERT INTO Directors(DirectorName, Notes) VALUES
('Ivan', NULL),
('Georgi', NULL),
('Pavel', NULL),
('Pesho', NULL),
('M. Night', 'Plot twists!')

CREATE TABLE Genres(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	GenreName nvarchar(200) NOT NULL,
	Notes nvarchar(max)
)

INSERT INTO Genres(GenreName, Notes) VALUES
('Comedy', 'Funny'),
('Horror', 'Scary'),
('Fantasy', 'Fantastical'),
('Sci-fi', 'Sciency stuff'),
('Romantic', 'Lovey Dovey')

CREATE TABLE Categories(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	CategoryName nvarchar(200) NOT NULL,
	Notes nvarchar(max)
)

INSERT INTO Categories(CategoryName, Notes) VALUES
('A', 'for kids'),
('B', 'for everyone'),
('C', '12+'),
('D', '16+'),
('F', '18+')

CREATE TABLE Movies(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Title nvarchar(200) NOT NULL,
	DirectorId int FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
	CopyrightYear int NOT NULL,
	Length time NOT NULL,
	GenreId int FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
	CategoryId int FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Rating int NOT NULL,
	Notes nvarchar(max) 
)

INSERT INTO Movies(Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes) VALUES
('Arrival', 1, 2016, '2:00:00', 4, 3, 8, NULL),
('Deadpool', 2, 2016, '1:40:00', 1, 4, 9, NULL),
('The Hateful Eight', 3, 2015, '2:15:00', 2, 4, 9, NULL),
('Titanic', 4, 1997, '2:00:00', 5, 2, 7, NULL),
('Lord of the Rings', 5, 2001, '2:20:00', 3, 2, 10, NULL)