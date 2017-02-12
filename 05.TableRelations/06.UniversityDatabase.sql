CREATE DATABASE University

USE University

CREATE TABLE Subjects(
	SubjectID int IDENTITY PRIMARY KEY NOT NULL,
	SubjectName varchar(50) NOT NULL
)

CREATE TABLE Majors(
	MajorID int IDENTITY PRIMARY KEY NOT NULL,
	Name varchar(50)
)

CREATE TABLE Students(
	StudentID int IDENTITY PRIMARY KEY NOT NULL,
	StudentNumber int NOT NULL,
	StudentName varchar(50) NOT NULL,
	MajorID int NOT NULL,
	CONSTRAINT FK_Students_Majors
	FOREIGN KEY (MajorID)
	REFERENCES Majors(MajorID)
)

CREATE TABLE Agenda(
	StudentID int NOT NULL,
	CONSTRAINT FK_Agenda_Students
	FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID),
	SubjectID int NOT NULL,
	CONSTRAINT FK_Agenda_Subjects
	FOREIGN KEY (SubjectID)
	REFERENCES Subjects,
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE Payments(
	PaymentID int IDENTITY PRIMARY KEY NOT NULL,
	PaymentDate date NOT NULL,
	PaymentAmount money NOT NULL,
	StudentID int NOT NULL,
	CONSTRAINT FK_Payments_Students
	FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID)
)