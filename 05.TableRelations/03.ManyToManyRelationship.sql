USE TableRelationsExercise

CREATE TABLE Students(
	StudentID int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(255) NOT NULL
)

CREATE TABLE Exams(
	ExamID int IDENTITY(101, 1) PRIMARY KEY NOT NULL,
	Name varchar(255) NOT NULL
)

CREATE TABLE StudentsExams(
	StudentID int NOT NULL,
	CONSTRAINT FK_StudentsExams_Students
	FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID),
	ExamID int NOT NULL,
	CONSTRAINT FK_StudentsExams_Exams
	FOREIGN KEY (ExamID)
	REFERENCES Exams(ExamID),
	CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID, ExamID)
)

INSERT INTO Students(Name) VALUES
('Mila'),
('Toni'),
('Ron')

INSERT INTO Exams(Name) VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

INSERT INTO StudentsExams VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)