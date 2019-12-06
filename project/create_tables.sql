DROP TABLE IF EXISTS Hotel;
CREATE TABLE Hotel(
	HotelID CHAR(10) NOT NULL,
	Address CHAR(64),
	manages CHAR(16) NOT NULL,
	PRIMARY KEY(HotelID)
);

DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff(
	SSN CHAR(10) NOT NULL,
	fName CHAR(16),
	lName CHAR(16),
	Address CHAR(64),
	employs CHAR(16) NOT NULL,
	role CHAR(16),
	PRIMARY KEY(SSN),
	FOREIGN KEY(employs) REFERENCES Hotel(HotelID)
);

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer(
	CustomerID CHAR(10) NOT NULL,
	fName CHAR(16),
	lName CHAR(16),
	Address CHAR(64),
	phNo CHAR(16),
	DOB CHAR(16),
	Gender CHAR(16),
	PRIMARY KEY(CustomerID)
);

DROP TABLE IF EXISTS Room;
CREATE TABLE Room(
	RoomNo CHAR(10) NOT NULL,
	Type CHAR(20),
	HotelID CHAR(10) NOT NULL,
	has CHAR(10) NOT NULL,
	PRIMARY KEY(HotelID, RoomNo),
	FOREIGN KEY(HotelID) REFERENCES Hotel(HotelID) ON DELETE CASCADE,
	FOREIGN KEY(has) REFERENCES Hotel(HotelID)
);

DROP TABLE IF EXISTS Maintenance_Company;
CREATE TABLE Maintenance_Company(
	cmpID CHAR(10) NOT NULL,
	Name CHAR(16),
	Address CHAR(64),
	Certified CHAR(10),
	PRIMARY KEY(cmpID)
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking(
	booking_date DATE,
	num_people INTEGER,
	price INTEGER,
	CustomerID CHAR(10) NOT NULL,
	HotelID CHAR(10) NOT NULL,
	RoomNo CHAR(10) NOT NULL,
	PRIMARY KEY(CustomerID, RoomNo),
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY(HotelID, RoomNo) REFERENCES Room(HotelID, RoomNo)	
);

DROP TABLE IF EXISTS repair;
CREATE TABLE repair(
	repair_date DATE,
	description CHAR(256),
	repair_type CHAR(64),
	RoomNo CHAR(10) NOT NULL,
	HotelID CHAR(10) NOT NULL,
	cmpID CHAR(10) NOT NULL,
	PRIMARY KEY(RoomNo, cmpID),
	FOREIGN KEY(HotelID, RoomNo) REFERENCES Room(HotelID, RoomNo),
	FOREIGN KEY(cmpID) REFERENCES Maintenance_Company(cmpID)
);

DROP TABLE IF EXISTS requests;
CREATE TABLE requests(
	requests_date DATE,
	description CHAR(256),
	SSN CHAR(10) NOT NULL,
	cmpID CHAR(10) NOT NULL,
	PRIMARY KEY(SSN, cmpID),
	FOREIGN KEY(SSN) REFERENCES STAFF (SSN),
	FOREIGN KEY(cmpID) REFERENCES Maintenance_Company(cmpID)
);

DROP TABLE IF EXISTS assigned;
CREATE TABLE assigned(
	SSN CHAR(10) NOT NULL,
	RoomNo CHAR(10) NOT NULL,
	HotelID CHAR(10) NOT NULL,
	PRIMARY KEY(SSN, RoomNo),
	FOREIGN KEY(SSN) REFERENCES Staff(SSN),
	FOREIGN KEY(HotelID, RoomNo) REFERENCES Room(HotelID, RoomNo)
);

ALTER TABLE Hotel
	ADD CONSTRAINT manages FOREIGN KEY(manages) REFERENCES Staff(SSN) ON DELETE NO ACTION;