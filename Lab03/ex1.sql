DROP TABLE IF EXISTS Professors;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS work_dept;
DROP TABLE IF EXISTS runs;
DROP TABLE IF EXISTS work_in;
DROP TABLE IF EXISTS manage;
DROP TABLE IF EXISTS supervise;
DROP TABLE IF EXISTS work_proj;
DROP TABLE IF EXISTS advise;
DROP TABLE IF EXISTS major;

CREATE TABLE Professors (
	ssn numeric(9, 0) NOT NULL,
	name CHAR(20),
	age INTEGER,
	rank CHAR(20),
	specialty CHAR(20),
	PRIMARY KEY(ssn)
);

CREATE TABLE Department (
	dno INTEGER NOT NULL,
	dname CHAR(20),
	office CHAR(10),
	PRIMARY KEY(dno)
);

CREATE TABLE Graduate (
	ssn numeric(9, 0) NOT NULL,
	name CHAR(20),
	age INTEGER,
	deg_pg CHAR(20),
	PRIMARY KEY(ssn)
);

CREATE TABLE Project (
	pno INTEGER NOT NULL,
	sponsor CHAR(20),
	start_date DATE,
	end_date DATE,
	budget INTEGER,
	PRIMARY KEY(pno),
);
