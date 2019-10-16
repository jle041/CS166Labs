DROP TABLE IF EXISTS Musician;
DROP TABLE IF EXISTS Instrument;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS Telephone;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS Telephone;
DROP TABLE IF EXISTS plays;
DROP TABLE IF EXISTS perform;
DROP TABLE IF EXISTS lives;

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

CREATE TABLE plays(ssn numeric(9, 0) NOT NULL,
			instrid numeric(9, 0) NOT NULL,
			PRIMARY KEY(ssn, instrid),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(instrid) REFERENCES Instrument(instrid));

CREATE TABLE perform(ssn numeric(9, 0) NOT NULL,
			songid numeric(9, 0) NOT NULL,
			PRIMARY KEY(ssn, songid),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(songid) REFERENCES Instrument(songid));

CREATE TABLE lives(ssn numeric(9, 0) NOT NULL,
			address CHAR(40) NOT NULL,
			PRIMARY KEY(ssn, address),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(address) REFERENCES Place(address));
