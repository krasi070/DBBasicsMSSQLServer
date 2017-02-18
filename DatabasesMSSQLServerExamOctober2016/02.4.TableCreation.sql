USE October2016Exam

CREATE TABLE CustomerReviews(
	ReviewID int PRIMARY KEY NOT NULL,
	ReviewContent varchar(255) NOT NULL,
	ReviewGrade tinyint CHECK(ReviewGrade >= 0 AND ReviewGrade <= 10) NOT NULL,
	AirlineID int NOT NULL FOREIGN KEY REFERENCES Airlines(AirlineID),
	CustomerID int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE CustomerBankAccounts(
	AccountID int PRIMARY KEY NOT NULL,
	AccountNumber varchar(10) UNIQUE NOT NULL,
	Balance decimal(10, 2) NOT NULL,
	CustomerID int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID)
)