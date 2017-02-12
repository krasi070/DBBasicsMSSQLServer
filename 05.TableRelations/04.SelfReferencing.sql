USE TableRelationsExercise

CREATE TABLE Teachers(
	TeacherID int IDENTITY(101, 1) PRIMARY KEY NOT NULL,
	Name varchar(255) NOT NULL,
	ManagerID int,
	CONSTRAINT FK_Teachers_Teachers
	FOREIGN KEY (ManagerID)
	REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers(Name, ManagerID) VALUES
('John', NULL),
('Maya', 106),
('Silvia', 106),
('Ted', 105),
('Mark', 101),
('Greta', 101)