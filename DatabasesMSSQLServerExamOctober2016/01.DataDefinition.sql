USE October2016Exam

CREATE TABLE Flights(
	FlightID int PRIMARY KEY NOT NULL,
	DepartureTime datetime NOT NULL,
	ArrivalTime datetime NOT NULL,
	Status varchar(9) CHECK (Status IN('Departing', 'Delayed', 'Arrived', 'Cancelled')),
	OriginAirportID int NOT NULL FOREIGN KEY REFERENCES Airports(AirportID),
	DestinationAirportID int NOT NULL FOREIGN KEY REFERENCES Airports(AirportID),
	AirlineID int NOT NULL FOREIGN KEY REFERENCES Airlines(AirlineID)
)

CREATE TABLE Tickets(
	TicketID int PRIMARY KEY NOT NULL,
	Price decimal(8, 2) NOT NULL,
	Class varchar(6) CHECK (Class IN('First', 'Second', 'Third')),
	Seat varchar(5) NOT NULL,
	CustmerID int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID),
	FlightID int NOT NULL FOREIGN KEY REFERENCES Flights(FlightID) 
)