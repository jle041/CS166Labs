DROP TABLE IF EXISTS Musician;
DROP TABLE IF EXISTS Instrument;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS Telephone;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Album;


CREATE TABLE Musician(ssn numeric(9, 0),
			name CHAR(20),
			PRIMARY KEY(ssn));

CREATE TABLE Instrument(instrid numeric(9, 0),
			dname CHAR(20),
			key CHAR(20)
			PRIMARY KEY(instrid));

CREATE TABLE Songs(songid numeric(9, 0),
			title CHAR(20),
			author CHAR(20),
			appears CHAR(20) NOT NULL,
			PRIMARY KEY(songid)
			FOREIGN KEY(appears) REFERENCES Album(albumidentifier));

CREATE TABLE Album(albumidentifier numeric(9, 0),
			copyrightDate DATE,
			speed CHAR(20),
			title CHAR(20),
			producer CHAR(20) NOT NULL,
			PRIMARY KEY(albumidentifier)
			FOREIGN KEY(producer) REFERENCES Musician(ssn));

CREATE TABLE Place(address CHAR(40),
			PRIMARY KEY(address));

CREATE TABLE Telephone(phone_no CHAR(20),
			home CHAR(40) NOT NULL,
			FOREIGN KEY(home) REFERENCES Place(address));
